import io
import json
import subprocess
import unittest
from unittest.mock import patch
from urllib.error import HTTPError

import grants
import submissions


def issue(n, target, *labels, count=1):
    return dict(number=n, url=f'https://api.github.com/repos/r/p/issues/{n}', title='Claim ' + target,
                user=dict(login='owner', type='User'), state='open', comments=count,
                labels=[{'name': label} for label in labels])


def comment(i, n, body, login='github-actions[bot]'):
    return dict(id=n, issue_url=i['url'], body=body, user={'login': login})


class CoordinatorTests(unittest.TestCase):
    def test_packet_priority_uses_latest_bot_comment_across_pages(self):
        module = issue(1, 'M000001', count=0)
        packet = issue(2, 'P0001', 'claim', 'claim-granted')
        other = issue(3, 'P9999')
        old = comment(packet, 1, 'Granted `P1234`.')
        noise = [comment(other, n, 'unrelated') for n in range(2, 101)]
        newest = comment(packet, 101, 'Granted `P0001`.')
        forged = comment(packet, 102, 'Granted `P4321`.', 'owner')
        reads = {
            '/issues?state=open&per_page=100&page=1': [module, packet],
            '/' + grants.COMMENT_FEED + '&page=1': [old, *noise],
            '/' + grants.COMMENT_FEED + '&page=2': [newest, forged],
        }
        writes = []

        def api(route, method='GET', body=None):
            if method == 'GET':
                return reads[route]
            writes.append((route, body))

        rows = [dict(id='M000001', packet='P0001', state='open')]
        with patch.object(grants, 'load', return_value=rows), patch.object(grants, 'api', side_effect=api):
            grants.reconcile()
        self.assertEqual([r for r, _ in writes], ['/issues/1/labels', '/issues/1/comments'])
        self.assertEqual(writes[0][1]['labels'], ['claim', 'claim-conflict'])

    def test_recover_interrupted_conflict_notification_only_once(self):
        taken = issue(1, 'P0001', 'claim', 'claim-conflict', count=0)
        rows = [dict(id='M000001', packet='P0001', state='assigned')]
        notices = []

        def api(route, method='GET', body=None):
            if method == 'POST':
                self.assertEqual(route, '/issues/1/comments')
                notices.append(comment(taken, 1, body['body']))
                taken['comments'] = 1
            elif route.startswith('/issues?'):
                return [taken]
            else:
                self.assertIn(grants.COMMENT_FEED, route)
                return notices

        with patch.object(grants, 'load', return_value=rows), patch.object(grants, 'api', side_effect=api):
            grants.reconcile()
            grants.reconcile()
        self.assertEqual(len(notices), 1)

    def test_shared_credit_scan_uses_author_submission_and_matching_bot_grant(self):
        active = issue(1, 'P0001', 'claim-granted')
        done = issue(2, 'P0002')
        done['state'] = 'closed'
        comments = [comment(active, 1, 'Granted `P0001`.'),
                    comment(active, 2, 'Replay submission', 'stranger'),
                    comment(done, 3, 'Replay submission', 'owner'),
                    comment(done, 4, 'Replay submission\nlatest', 'owner')]
        responses = [[active, done], comments]
        with patch.object(submissions, 'pages', side_effect=responses) as pages, patch.object(submissions, 'ROOT') as root:
            root.__truediv__.return_value.glob.return_value = []
            self.assertEqual(list(submissions.volunteer_updates('r/p')),
                             [(1, 'owner', 'P0001', None), (2, 'owner', 'P0002', 4)])
        self.assertEqual(pages.call_count, 2)

    def test_rate_limit_waits_and_restarts_but_permissions_fail_immediately(self):
        def denied(code, headers, body=b''):
            error = HTTPError('https://api.github.com', code, 'rejected', headers, io.BytesIO(body))
            self.addCleanup(error.close)
            return error

        with patch('time.time', return_value=1000):
            self.assertEqual(grants.rate_limit_delay(denied(403, {'X-RateLimit-Remaining': '0',
                             'X-RateLimit-Reset': '4600'}), 0), 3601)
        self.assertEqual(grants.rate_limit_delay(denied(403, {}, b'secondary rate limit'), 1), 120)
        with patch.object(grants, 'reconcile', side_effect=[denied(429, {'Retry-After': '90'}), None]) as run, \
                patch('time.sleep') as sleep:
            grants.main()
            sleep.assert_called_once_with(90)
            self.assertEqual(run.call_count, 2)
        with patch.object(grants, 'reconcile', side_effect=denied(403, {}, b'permission denied')), \
                patch('time.sleep') as sleep:
            with self.assertRaises(HTTPError):
                grants.main()
            sleep.assert_not_called()

    def test_credit_scan_waits_for_rate_limit_reset_but_other_failures_fail_immediately(self):
        def gh(code, stdout='', stderr=''):
            return subprocess.CompletedProcess([], code, stdout, stderr)

        def quota(core, graphql):
            return json.dumps({'resources': {'core': {'remaining': core, 'reset': 4600},
                                             'graphql': {'remaining': graphql, 'reset': 2000}}})

        limited = gh(1, stderr='gh: API rate limit exceeded for installation. (HTTP 403)')
        with patch.object(submissions.subprocess, 'check_output', return_value=quota(10, 0)), \
                patch('time.time', return_value=1000):
            self.assertEqual(submissions.rate_limit_delay(limited.stderr, 0), 1001)
        with patch.object(submissions.subprocess, 'run', side_effect=[limited, gh(0, '[[{"n": 1}], [{"n": 2}]]')]) as run, \
                patch.object(submissions.subprocess, 'check_output', return_value=quota(0, 10)), \
                patch('time.time', return_value=1000), patch('time.sleep') as sleep:
            self.assertEqual(list(submissions.pages('r/p', 'issues?per_page=100')), [{'n': 1}, {'n': 2}])
            sleep.assert_called_once_with(3601)
            self.assertEqual(run.call_count, 2)

        with patch.object(submissions.subprocess, 'check_output', return_value=quota(4000, 4000)):
            self.assertEqual(submissions.rate_limit_delay('You have exceeded a secondary rate limit', 1), 120)
        self.assertIsNone(submissions.rate_limit_delay('gh: Not Found (HTTP 404)', 0))

        with patch.object(submissions.subprocess, 'run', return_value=gh(1, stderr='gh: Not Found (HTTP 404)')), \
                patch('time.sleep') as sleep, patch('sys.stderr', io.StringIO()):
            with self.assertRaises(subprocess.CalledProcessError):
                list(submissions.pages('r/p', 'issues?per_page=100'))
            sleep.assert_not_called()

        with patch.object(submissions.subprocess, 'run', return_value=limited) as run, \
                patch.object(submissions.subprocess, 'check_output', side_effect=subprocess.CalledProcessError(1, [])), \
                patch('time.sleep') as sleep, patch('sys.stderr', io.StringIO()):
            with self.assertRaises(subprocess.CalledProcessError):
                list(submissions.pages('r/p', 'issues?per_page=100'))
            self.assertEqual(run.call_count, submissions.ATTEMPTS)
            self.assertEqual([c.args[0] for c in sleep.call_args_list], [60, 120, 240])

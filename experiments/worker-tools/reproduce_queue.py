"""Check the captured volunteer queue using only the index repository and Git."""
import argparse
import csv
import gzip
import hashlib
import io
import json
import subprocess
from collections import Counter
from pathlib import Path


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('checkout', type=Path, help='local clone of rohanarun/alpoge-rh-replay')
    args = parser.parse_args()
    snapshot = json.loads(Path(__file__).with_name('queue-snapshot.json').read_text())
    inputs = {}
    for name, expected_digest in snapshot['input_sha256'].items():
        data = subprocess.check_output(
            ['git', '-C', str(args.checkout), 'show', snapshot['tracker_base'] + ':' + name])
        if hashlib.sha256(data).hexdigest() != expected_digest:
            raise SystemExit('Git input digest differs for ' + name)
        inputs[name] = data
    ledger = csv.DictReader(io.StringIO(inputs['tracker/completed.tsv'].decode()), delimiter='\t')
    done = {r['id']: r['evidence'] for r in ledger}
    rows = [json.loads(line) for line in gzip.decompress(inputs['tracker/modules.jsonl.gz']).splitlines()]
    claimed = set(snapshot['claims'])
    available = [r for r in rows if done.get(r['id'], r['state']) == 'open'
                 and r['id'] not in claimed and r['packet'] not in claimed]
    available_ids = {r['id'] for r in available}
    unavailable_packets = {r['packet'] for r in rows if r['id'] not in available_ids}
    leaves = [r for r in available if not r['imports']]
    partial = [r for r in leaves if r['packet'] in unavailable_packets]
    counts = {
        'all_index_rows': len(rows),
        'cold_modules': len(leaves),
        'packets_with_cold_modules': len({r['packet'] for r in leaves}),
        'wholly_available_depth_zero_packets': len({r['packet'] for r in leaves} - unavailable_packets),
        'additional_cold_modules_in_partial_packets': len(partial),
        'partial_packets': len({r['packet'] for r in partial}),
    }
    direct, sole = Counter(), Counter()
    for row in available:
        imports = set(row['imports'])
        direct.update(imports)
        if len(imports) == 1:
            sole.update(imports)
    ranked = sorted(leaves, key=lambda r: (-sole[r['id']], -direct[r['id']], r['id']))
    top = [dict(id=r['id'], packet=r['packet'], module=r['module'],
                sole=sole[r['id']], direct=direct[r['id']]) for r in ranked[:5]]
    if counts != snapshot['counts'] or top != snapshot['top_five']:
        raise SystemExit('Recomputed counts or rankings differ from the snapshot')
    print(json.dumps({'counts': counts, 'top_five': top}, indent=2))


if __name__ == '__main__':
    main()

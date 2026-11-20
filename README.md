# Independent replay of Alpöge’s RH release

Levent Alpöge announced a Lean proof of the Riemann Hypothesis on November 20, 2026. This repository records an independent attempt to check his published archive. Credit for the claimed proof belongs to Alpöge and his collaborators. [Original announcement](https://alpo.ge/remark.pdf)

## Current status

**Full replay in progress.** No full RH verification receipt has been produced by this project. The [two-worker pilot](evidence/pilot-receipt.json) transferred 150 previously unbuilt modules; the primary reused them and kernel-checked one downstream module.

Current cloud progress is recorded in the [worker status report](STATUS.md).

## Contributors

Choose any of **175,187 module tasks** or one of **2,858 work packets**. Each module has a source digest, direct dependencies, import depth, and a coordinator snapshot state. Use the [contributor guide](CONTRIBUTING.md) to find an available packet, claim it, build it, and return evidence. Browse the [packet index](tracker/packets.tsv), [snapshot totals](tracker/summary.json), or [open volunteer claims](https://github.com/rohanarun/alpoge-rh-replay/issues?q=is%3Aissue%20is%3Aopen%20in%3Atitle%20Claim).

Start with the [agent instructions](auto-research.md) to claim work and submit replay evidence. Start your evidence comment with `Replay submission` to be credited automatically. Maintainers review the evidence before marking a task complete.

[Volunteer activity chart](ACTIVITY.md)

### Active claims awaiting evidence

<!-- active-volunteers-start -->

| Contributor | Task | Status |
|---|---|---|
| [@dgahelper](https://github.com/dgahelper) | [P0826](https://github.com/rohanarun/alpoge-rh-replay/issues/160) | Claimed |
| [@shardmods](https://github.com/shardmods) | [P1340](https://github.com/rohanarun/alpoge-rh-replay/issues/181) | Claimed |
| [@shardmods](https://github.com/shardmods) | [P1467](https://github.com/rohanarun/alpoge-rh-replay/issues/195) | Claimed |
| [@shardmods](https://github.com/shardmods) | [P1261](https://github.com/rohanarun/alpoge-rh-replay/issues/202) | Claimed |
| [@Lv-00-ANI](https://github.com/Lv-00-ANI) | [M170889](https://github.com/rohanarun/alpoge-rh-replay/issues/204) | Claimed |
| [@Lv-00-ANI](https://github.com/Lv-00-ANI) | [M175186](https://github.com/rohanarun/alpoge-rh-replay/issues/208) | Claimed |
| [@Lv-00-ANI](https://github.com/Lv-00-ANI) | [M175187](https://github.com/rohanarun/alpoge-rh-replay/issues/211) | Claimed |
| [@Lv-00-ANI](https://github.com/Lv-00-ANI) | [M175185](https://github.com/rohanarun/alpoge-rh-replay/issues/213) | Claimed |
| [@Lv-00-ANI](https://github.com/Lv-00-ANI) | [M108233](https://github.com/rohanarun/alpoge-rh-replay/issues/214) | Claimed |
| [@Lv-00-ANI](https://github.com/Lv-00-ANI) | [M109322](https://github.com/rohanarun/alpoge-rh-replay/issues/215) | Claimed |
| [@TVSuchty](https://github.com/TVSuchty) | [M141625](https://github.com/rohanarun/alpoge-rh-replay/issues/243) | Claimed |
| [@TVSuchty](https://github.com/TVSuchty) | [M119659](https://github.com/rohanarun/alpoge-rh-replay/issues/244) | Claimed |
| [@surfyhou](https://github.com/surfyhou) | [P1099](https://github.com/rohanarun/alpoge-rh-replay/issues/245) | Claimed |
| [@surfyhou](https://github.com/surfyhou) | [P1279](https://github.com/rohanarun/alpoge-rh-replay/issues/248) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M049826](https://github.com/rohanarun/alpoge-rh-replay/issues/249) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M051308](https://github.com/rohanarun/alpoge-rh-replay/issues/250) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M157546](https://github.com/rohanarun/alpoge-rh-replay/issues/251) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M109400](https://github.com/rohanarun/alpoge-rh-replay/issues/252) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M131581](https://github.com/rohanarun/alpoge-rh-replay/issues/253) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M137272](https://github.com/rohanarun/alpoge-rh-replay/issues/254) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M168909](https://github.com/rohanarun/alpoge-rh-replay/issues/255) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M106334](https://github.com/rohanarun/alpoge-rh-replay/issues/256) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M051482](https://github.com/rohanarun/alpoge-rh-replay/issues/257) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M131798](https://github.com/rohanarun/alpoge-rh-replay/issues/258) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M007110](https://github.com/rohanarun/alpoge-rh-replay/issues/259) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M027152](https://github.com/rohanarun/alpoge-rh-replay/issues/260) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M138276](https://github.com/rohanarun/alpoge-rh-replay/issues/261) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M012733](https://github.com/rohanarun/alpoge-rh-replay/issues/262) | Claimed |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M161227](https://github.com/rohanarun/alpoge-rh-replay/issues/263) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M127561](https://github.com/rohanarun/alpoge-rh-replay/issues/264) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M100540](https://github.com/rohanarun/alpoge-rh-replay/issues/265) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M108607](https://github.com/rohanarun/alpoge-rh-replay/issues/266) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M110476](https://github.com/rohanarun/alpoge-rh-replay/issues/267) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M018347](https://github.com/rohanarun/alpoge-rh-replay/issues/268) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M120149](https://github.com/rohanarun/alpoge-rh-replay/issues/269) | Claimed |
| [@dga471](https://github.com/dga471) | [M113396](https://github.com/rohanarun/alpoge-rh-replay/issues/271) | Claimed |
| [@shardmods](https://github.com/shardmods) | [P1385](https://github.com/rohanarun/alpoge-rh-replay/issues/273) | Claimed |
| [@shardmods](https://github.com/shardmods) | [P1409](https://github.com/rohanarun/alpoge-rh-replay/issues/278) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M109467](https://github.com/rohanarun/alpoge-rh-replay/issues/279) | Claimed |
| [@JanSimeonMetzger](https://github.com/JanSimeonMetzger) | [P1069](https://github.com/rohanarun/alpoge-rh-replay/issues/281) | Claimed |
| [@JanSimeonMetzger](https://github.com/JanSimeonMetzger) | [P1202](https://github.com/rohanarun/alpoge-rh-replay/issues/285) | Claimed |
| [@JanSimeonMetzger](https://github.com/JanSimeonMetzger) | [P1115](https://github.com/rohanarun/alpoge-rh-replay/issues/289) | Claimed |
| [@JanSimeonMetzger](https://github.com/JanSimeonMetzger) | [P1002](https://github.com/rohanarun/alpoge-rh-replay/issues/292) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M022822](https://github.com/rohanarun/alpoge-rh-replay/issues/293) | Claimed |
| [@shardmods](https://github.com/shardmods) | [P1224](https://github.com/rohanarun/alpoge-rh-replay/issues/294) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M115941](https://github.com/rohanarun/alpoge-rh-replay/issues/295) | Claimed |
| [@shardmods](https://github.com/shardmods) | [P1337](https://github.com/rohanarun/alpoge-rh-replay/issues/296) | Claimed |
| [@shardmods](https://github.com/shardmods) | [P1362](https://github.com/rohanarun/alpoge-rh-replay/issues/297) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M134454](https://github.com/rohanarun/alpoge-rh-replay/issues/298) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M132746](https://github.com/rohanarun/alpoge-rh-replay/issues/299) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M130827](https://github.com/rohanarun/alpoge-rh-replay/issues/300) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M151538](https://github.com/rohanarun/alpoge-rh-replay/issues/301) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M091472](https://github.com/rohanarun/alpoge-rh-replay/issues/302) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M041328](https://github.com/rohanarun/alpoge-rh-replay/issues/303) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M139128](https://github.com/rohanarun/alpoge-rh-replay/issues/304) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M106331](https://github.com/rohanarun/alpoge-rh-replay/issues/305) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M129501](https://github.com/rohanarun/alpoge-rh-replay/issues/306) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M109462](https://github.com/rohanarun/alpoge-rh-replay/issues/308) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M130304](https://github.com/rohanarun/alpoge-rh-replay/issues/309) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M120082](https://github.com/rohanarun/alpoge-rh-replay/issues/310) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M074488](https://github.com/rohanarun/alpoge-rh-replay/issues/311) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M073937](https://github.com/rohanarun/alpoge-rh-replay/issues/312) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M012732](https://github.com/rohanarun/alpoge-rh-replay/issues/313) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M128457](https://github.com/rohanarun/alpoge-rh-replay/issues/314) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M022855](https://github.com/rohanarun/alpoge-rh-replay/issues/315) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M028088](https://github.com/rohanarun/alpoge-rh-replay/issues/316) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M120150](https://github.com/rohanarun/alpoge-rh-replay/issues/317) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M155516](https://github.com/rohanarun/alpoge-rh-replay/issues/318) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M134238](https://github.com/rohanarun/alpoge-rh-replay/issues/319) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M050260](https://github.com/rohanarun/alpoge-rh-replay/issues/321) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M124912](https://github.com/rohanarun/alpoge-rh-replay/issues/322) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M067379](https://github.com/rohanarun/alpoge-rh-replay/issues/323) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M074772](https://github.com/rohanarun/alpoge-rh-replay/issues/324) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M100283](https://github.com/rohanarun/alpoge-rh-replay/issues/325) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M071407](https://github.com/rohanarun/alpoge-rh-replay/issues/326) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M134128](https://github.com/rohanarun/alpoge-rh-replay/issues/327) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M069747](https://github.com/rohanarun/alpoge-rh-replay/issues/328) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M162663](https://github.com/rohanarun/alpoge-rh-replay/issues/329) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M073866](https://github.com/rohanarun/alpoge-rh-replay/issues/330) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M163926](https://github.com/rohanarun/alpoge-rh-replay/issues/331) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M113668](https://github.com/rohanarun/alpoge-rh-replay/issues/332) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M138604](https://github.com/rohanarun/alpoge-rh-replay/issues/333) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M013761](https://github.com/rohanarun/alpoge-rh-replay/issues/334) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M152722](https://github.com/rohanarun/alpoge-rh-replay/issues/335) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M139893](https://github.com/rohanarun/alpoge-rh-replay/issues/336) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M134256](https://github.com/rohanarun/alpoge-rh-replay/issues/337) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M131677](https://github.com/rohanarun/alpoge-rh-replay/issues/338) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M086083](https://github.com/rohanarun/alpoge-rh-replay/issues/340) | Claimed |
| [@dgahelper](https://github.com/dgahelper) | [P1145](https://github.com/rohanarun/alpoge-rh-replay/issues/341) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M097605](https://github.com/rohanarun/alpoge-rh-replay/issues/342) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M006518](https://github.com/rohanarun/alpoge-rh-replay/issues/343) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M072817](https://github.com/rohanarun/alpoge-rh-replay/issues/344) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M159371](https://github.com/rohanarun/alpoge-rh-replay/issues/345) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M032848](https://github.com/rohanarun/alpoge-rh-replay/issues/346) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M138422](https://github.com/rohanarun/alpoge-rh-replay/issues/348) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M056437](https://github.com/rohanarun/alpoge-rh-replay/issues/349) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M090468](https://github.com/rohanarun/alpoge-rh-replay/issues/350) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M123311](https://github.com/rohanarun/alpoge-rh-replay/issues/351) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M083938](https://github.com/rohanarun/alpoge-rh-replay/issues/352) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M166737](https://github.com/rohanarun/alpoge-rh-replay/issues/353) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M148169](https://github.com/rohanarun/alpoge-rh-replay/issues/354) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M006646](https://github.com/rohanarun/alpoge-rh-replay/issues/356) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M012742](https://github.com/rohanarun/alpoge-rh-replay/issues/358) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M170457](https://github.com/rohanarun/alpoge-rh-replay/issues/359) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M134070](https://github.com/rohanarun/alpoge-rh-replay/issues/360) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M165536](https://github.com/rohanarun/alpoge-rh-replay/issues/361) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M012984](https://github.com/rohanarun/alpoge-rh-replay/issues/362) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M070016](https://github.com/rohanarun/alpoge-rh-replay/issues/363) | Claimed |
| [@surfyhou](https://github.com/surfyhou) | [P1252](https://github.com/rohanarun/alpoge-rh-replay/issues/364) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M090649](https://github.com/rohanarun/alpoge-rh-replay/issues/366) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M091323](https://github.com/rohanarun/alpoge-rh-replay/issues/367) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M119902](https://github.com/rohanarun/alpoge-rh-replay/issues/368) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M130487](https://github.com/rohanarun/alpoge-rh-replay/issues/369) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M012641](https://github.com/rohanarun/alpoge-rh-replay/issues/370) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M068293](https://github.com/rohanarun/alpoge-rh-replay/issues/371) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M007088](https://github.com/rohanarun/alpoge-rh-replay/issues/372) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M108215](https://github.com/rohanarun/alpoge-rh-replay/issues/374) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M072131](https://github.com/rohanarun/alpoge-rh-replay/issues/375) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M065036](https://github.com/rohanarun/alpoge-rh-replay/issues/376) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M064914](https://github.com/rohanarun/alpoge-rh-replay/issues/377) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M024295](https://github.com/rohanarun/alpoge-rh-replay/issues/379) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M147748](https://github.com/rohanarun/alpoge-rh-replay/issues/380) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M047890](https://github.com/rohanarun/alpoge-rh-replay/issues/381) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M169499](https://github.com/rohanarun/alpoge-rh-replay/issues/382) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M070822](https://github.com/rohanarun/alpoge-rh-replay/issues/383) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M144954](https://github.com/rohanarun/alpoge-rh-replay/issues/384) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M098665](https://github.com/rohanarun/alpoge-rh-replay/issues/385) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M098155](https://github.com/rohanarun/alpoge-rh-replay/issues/386) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M109992](https://github.com/rohanarun/alpoge-rh-replay/issues/387) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M140405](https://github.com/rohanarun/alpoge-rh-replay/issues/388) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M040460](https://github.com/rohanarun/alpoge-rh-replay/issues/389) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M174687](https://github.com/rohanarun/alpoge-rh-replay/issues/390) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M089133](https://github.com/rohanarun/alpoge-rh-replay/issues/391) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M174206](https://github.com/rohanarun/alpoge-rh-replay/issues/392) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M120756](https://github.com/rohanarun/alpoge-rh-replay/issues/393) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M027018](https://github.com/rohanarun/alpoge-rh-replay/issues/394) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M140764](https://github.com/rohanarun/alpoge-rh-replay/issues/395) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M036705](https://github.com/rohanarun/alpoge-rh-replay/issues/396) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M068496](https://github.com/rohanarun/alpoge-rh-replay/issues/397) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M087047](https://github.com/rohanarun/alpoge-rh-replay/issues/398) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M074433](https://github.com/rohanarun/alpoge-rh-replay/issues/399) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M150866](https://github.com/rohanarun/alpoge-rh-replay/issues/400) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M059722](https://github.com/rohanarun/alpoge-rh-replay/issues/401) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M154666](https://github.com/rohanarun/alpoge-rh-replay/issues/402) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M131483](https://github.com/rohanarun/alpoge-rh-replay/issues/404) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M056091](https://github.com/rohanarun/alpoge-rh-replay/issues/405) | Claimed |
| [@JanSimeonMetzger](https://github.com/JanSimeonMetzger) | [P1434](https://github.com/rohanarun/alpoge-rh-replay/issues/417) | Claimed |
| [@JanSimeonMetzger](https://github.com/JanSimeonMetzger) | [P1228](https://github.com/rohanarun/alpoge-rh-replay/issues/426) | Claimed |
| [@JanSimeonMetzger](https://github.com/JanSimeonMetzger) | [P1288](https://github.com/rohanarun/alpoge-rh-replay/issues/434) | Claimed |
| [@JanSimeonMetzger](https://github.com/JanSimeonMetzger) | [P1256](https://github.com/rohanarun/alpoge-rh-replay/issues/451) | Claimed |
| [@mu-mei](https://github.com/mu-mei) | [P1195](https://github.com/rohanarun/alpoge-rh-replay/issues/460) | Claimed |
| [@shardmods](https://github.com/shardmods) | [P1632](https://github.com/rohanarun/alpoge-rh-replay/issues/469) | Claimed |
| [@shardmods](https://github.com/shardmods) | [P1233](https://github.com/rohanarun/alpoge-rh-replay/issues/470) | Claimed |
| [@shardmods](https://github.com/shardmods) | [P1300](https://github.com/rohanarun/alpoge-rh-replay/issues/471) | Claimed |
| [@rohanarun](https://github.com/rohanarun) | [M154737](https://github.com/rohanarun/alpoge-rh-replay/issues/484) | Claimed |
| [@MLTQ](https://github.com/MLTQ) | [P2209](https://github.com/rohanarun/alpoge-rh-replay/issues/488) | Claimed |
| [@MLTQ](https://github.com/MLTQ) | [P1489](https://github.com/rohanarun/alpoge-rh-replay/issues/491) | Claimed |
| [@dga471](https://github.com/dga471) | [M133853](https://github.com/rohanarun/alpoge-rh-replay/issues/519) | Claimed |
| [@Genius-Cai-wen-zheng](https://github.com/Genius-Cai-wen-zheng) | [P1582](https://github.com/rohanarun/alpoge-rh-replay/issues/536) | Claimed |
| [@Genius-Cai-wen-zheng](https://github.com/Genius-Cai-wen-zheng) | [P1612](https://github.com/rohanarun/alpoge-rh-replay/issues/538) | Claimed |
| [@Genius-Cai-wen-zheng](https://github.com/Genius-Cai-wen-zheng) | [P1554](https://github.com/rohanarun/alpoge-rh-replay/issues/540) | Claimed |
| [@SeriousRising](https://github.com/SeriousRising) | [P1250](https://github.com/rohanarun/alpoge-rh-replay/issues/543) | Claimed |
| [@shardmods](https://github.com/shardmods) | [P1496](https://github.com/rohanarun/alpoge-rh-replay/issues/556) | Claimed |
| [@shardmods](https://github.com/shardmods) | [P1630](https://github.com/rohanarun/alpoge-rh-replay/issues/557) | Claimed |
| [@shardmods](https://github.com/shardmods) | [P1577](https://github.com/rohanarun/alpoge-rh-replay/issues/558) | Claimed |
| [@emsi](https://github.com/emsi) | [P1309](https://github.com/rohanarun/alpoge-rh-replay/issues/572) | Claimed |
| [@dh5at](https://github.com/dh5at) | [P1120](https://github.com/rohanarun/alpoge-rh-replay/issues/581) | Claimed |
| [@unhingedpanda](https://github.com/unhingedpanda) | [M164589](https://github.com/rohanarun/alpoge-rh-replay/issues/593) | Claimed |
| [@Ethan-prog-netizen](https://github.com/Ethan-prog-netizen) | [M015310](https://github.com/rohanarun/alpoge-rh-replay/issues/602) | Claimed |
| [@maddoxjack](https://github.com/maddoxjack) | [M063851](https://github.com/rohanarun/alpoge-rh-replay/issues/604) | Claimed |
| [@dh5at](https://github.com/dh5at) | [P1244](https://github.com/rohanarun/alpoge-rh-replay/issues/611) | Claimed |
| [@BenCaunt](https://github.com/BenCaunt) | [M131551](https://github.com/rohanarun/alpoge-rh-replay/issues/612) | Claimed |
| [@BenCaunt](https://github.com/BenCaunt) | [M043258](https://github.com/rohanarun/alpoge-rh-replay/issues/616) | Claimed |
| [@BenCaunt](https://github.com/BenCaunt) | [M043296](https://github.com/rohanarun/alpoge-rh-replay/issues/618) | Claimed |
| [@BenCaunt](https://github.com/BenCaunt) | [M066992](https://github.com/rohanarun/alpoge-rh-replay/issues/621) | Claimed |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M021331](https://github.com/rohanarun/alpoge-rh-replay/issues/622) | Claimed |
| [@BenCaunt](https://github.com/BenCaunt) | [M139159](https://github.com/rohanarun/alpoge-rh-replay/issues/623) | Claimed |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M038602](https://github.com/rohanarun/alpoge-rh-replay/issues/624) | Claimed |

<!-- active-volunteers-end -->

### Submitted for review

<!-- pending-volunteers-start -->

| Contributor | Task | Review |
|---|---|---|
| [@MLTQ](https://github.com/MLTQ) | [P0123](https://github.com/rohanarun/alpoge-rh-replay/issues/87#issuecomment-7046017638) | Pending review |
| [@Paulee314](https://github.com/Paulee314) | [M004105](https://github.com/rohanarun/alpoge-rh-replay/issues/174#issuecomment-7047351997) | Pending review |
| [@shardmods](https://github.com/shardmods) | [P1219](https://github.com/rohanarun/alpoge-rh-replay/issues/187#issuecomment-7047636691) | Pending review |
| [@shardmods](https://github.com/shardmods) | [P0945](https://github.com/rohanarun/alpoge-rh-replay/issues/189#issuecomment-7047708357) | Pending review |
| [@roonastgames](https://github.com/roonastgames) | [M164707](https://github.com/rohanarun/alpoge-rh-replay/issues/196#issuecomment-7047745703) | Pending review |
| [@shardmods](https://github.com/shardmods) | [P1030](https://github.com/rohanarun/alpoge-rh-replay/issues/206#issuecomment-7047704062) | Pending review |
| [@shardmods](https://github.com/shardmods) | [P0975](https://github.com/rohanarun/alpoge-rh-replay/issues/272#issuecomment-7047712807) | Pending review |
| [@jjjhenriksen](https://github.com/jjjhenriksen) | [M163892](https://github.com/rohanarun/alpoge-rh-replay/issues/474#issuecomment-7047748678) | Pending review |
| [@BenCaunt](https://github.com/BenCaunt) | [M140820](https://github.com/rohanarun/alpoge-rh-replay/issues/510#issuecomment-7047641493) | Pending review |
| [@BenCaunt](https://github.com/BenCaunt) | [M002605](https://github.com/rohanarun/alpoge-rh-replay/issues/513#issuecomment-7047616017) | Pending review |
| [@BenCaunt](https://github.com/BenCaunt) | [M004075](https://github.com/rohanarun/alpoge-rh-replay/issues/514#issuecomment-7047643010) | Pending review |
| [@BenCaunt](https://github.com/BenCaunt) | [M006434](https://github.com/rohanarun/alpoge-rh-replay/issues/515#issuecomment-7047661068) | Pending review |
| [@BenCaunt](https://github.com/BenCaunt) | [M120165](https://github.com/rohanarun/alpoge-rh-replay/issues/516#issuecomment-7047660496) | Pending review |
| [@BenCaunt](https://github.com/BenCaunt) | [M141615](https://github.com/rohanarun/alpoge-rh-replay/issues/518#issuecomment-7047616574) | Pending review |
| [@BenCaunt](https://github.com/BenCaunt) | [M021211](https://github.com/rohanarun/alpoge-rh-replay/issues/530#issuecomment-7047640618) | Pending review |
| [@BenCaunt](https://github.com/BenCaunt) | [M058057](https://github.com/rohanarun/alpoge-rh-replay/issues/531#issuecomment-7047616253) | Pending review |
| [@Wronskode](https://github.com/Wronskode) | [M001169](https://github.com/rohanarun/alpoge-rh-replay/issues/545#issuecomment-7047608539) | Pending review |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M006437](https://github.com/rohanarun/alpoge-rh-replay/issues/554#issuecomment-7047610559) | Pending review |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M031741](https://github.com/rohanarun/alpoge-rh-replay/issues/555#issuecomment-7047610710) | Pending review |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M154131](https://github.com/rohanarun/alpoge-rh-replay/issues/559#issuecomment-7047621988) | Pending review |
| [@gabeldev](https://github.com/gabeldev) | [M119955](https://github.com/rohanarun/alpoge-rh-replay/issues/560#issuecomment-7047614904) | Pending review |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M157611](https://github.com/rohanarun/alpoge-rh-replay/issues/561#issuecomment-7047626093) | Pending review |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M164586](https://github.com/rohanarun/alpoge-rh-replay/issues/562#issuecomment-7047625784) | Pending review |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M000425](https://github.com/rohanarun/alpoge-rh-replay/issues/563#issuecomment-7047632092) | Pending review |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M058332](https://github.com/rohanarun/alpoge-rh-replay/issues/564#issuecomment-7047635199) | Pending review |
| [@hipotures](https://github.com/hipotures) | [M046334](https://github.com/rohanarun/alpoge-rh-replay/issues/565#issuecomment-7047634147) | Pending review |
| [@gabeldev](https://github.com/gabeldev) | [M171920](https://github.com/rohanarun/alpoge-rh-replay/issues/566#issuecomment-7047640129) | Pending review |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M101539](https://github.com/rohanarun/alpoge-rh-replay/issues/567#issuecomment-7047644878) | Pending review |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M104742](https://github.com/rohanarun/alpoge-rh-replay/issues/568#issuecomment-7047653004) | Pending review |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M109806](https://github.com/rohanarun/alpoge-rh-replay/issues/570#issuecomment-7047650646) | Pending review |
| [@Wronskode](https://github.com/Wronskode) | [M154276](https://github.com/rohanarun/alpoge-rh-replay/issues/571#issuecomment-7047713338) | Pending review |
| [@hipotures](https://github.com/hipotures) | [M101545](https://github.com/rohanarun/alpoge-rh-replay/issues/573#issuecomment-7047654249) | Pending review |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M159034](https://github.com/rohanarun/alpoge-rh-replay/issues/574#issuecomment-7047655971) | Pending review |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M165431](https://github.com/rohanarun/alpoge-rh-replay/issues/575#issuecomment-7047666320) | Pending review |
| [@gabeldev](https://github.com/gabeldev) | [M004210](https://github.com/rohanarun/alpoge-rh-replay/issues/576#issuecomment-7047666391) | Pending review |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M005733](https://github.com/rohanarun/alpoge-rh-replay/issues/577#issuecomment-7047676357) | Pending review |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M073057](https://github.com/rohanarun/alpoge-rh-replay/issues/578#issuecomment-7047673593) | Pending review |
| [@hipotures](https://github.com/hipotures) | [M108303](https://github.com/rohanarun/alpoge-rh-replay/issues/579#issuecomment-7047674839) | Pending review |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M154036](https://github.com/rohanarun/alpoge-rh-replay/issues/582#issuecomment-7047686340) | Pending review |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M154086](https://github.com/rohanarun/alpoge-rh-replay/issues/584#issuecomment-7047690228) | Pending review |
| [@gabeldev](https://github.com/gabeldev) | [M055605](https://github.com/rohanarun/alpoge-rh-replay/issues/585#issuecomment-7047689966) | Pending review |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M022708](https://github.com/rohanarun/alpoge-rh-replay/issues/586#issuecomment-7047701075) | Pending review |
| [@hipotures](https://github.com/hipotures) | [M001082](https://github.com/rohanarun/alpoge-rh-replay/issues/587#issuecomment-7047693999) | Pending review |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M000920](https://github.com/rohanarun/alpoge-rh-replay/issues/590#issuecomment-7047701736) | Pending review |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M120681](https://github.com/rohanarun/alpoge-rh-replay/issues/591#issuecomment-7047707774) | Pending review |
| [@BenCaunt](https://github.com/BenCaunt) | [M123385](https://github.com/rohanarun/alpoge-rh-replay/issues/592#issuecomment-7047719246) | Pending review |
| [@gabeldev](https://github.com/gabeldev) | [M081901](https://github.com/rohanarun/alpoge-rh-replay/issues/595#issuecomment-7047705540) | Pending review |
| [@BenCaunt](https://github.com/BenCaunt) | [M075186](https://github.com/rohanarun/alpoge-rh-replay/issues/596#issuecomment-7047723458) | Pending review |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M153474](https://github.com/rohanarun/alpoge-rh-replay/issues/597#issuecomment-7047718846) | Pending review |
| [@hipotures](https://github.com/hipotures) | [M009521](https://github.com/rohanarun/alpoge-rh-replay/issues/598#issuecomment-7047713233) | Pending review |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M173551](https://github.com/rohanarun/alpoge-rh-replay/issues/599#issuecomment-7047721149) | Pending review |
| [@BenCaunt](https://github.com/BenCaunt) | [M129547](https://github.com/rohanarun/alpoge-rh-replay/issues/601#issuecomment-7047743052) | Pending review |
| [@BenCaunt](https://github.com/BenCaunt) | [M101647](https://github.com/rohanarun/alpoge-rh-replay/issues/605#issuecomment-7047745022) | Pending review |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M031784](https://github.com/rohanarun/alpoge-rh-replay/issues/606#issuecomment-7047732297) | Pending review |
| [@BenCaunt](https://github.com/BenCaunt) | [M130687](https://github.com/rohanarun/alpoge-rh-replay/issues/608#issuecomment-7047745254) | Pending review |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M051622](https://github.com/rohanarun/alpoge-rh-replay/issues/609#issuecomment-7047739682) | Pending review |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M084788](https://github.com/rohanarun/alpoge-rh-replay/issues/613#issuecomment-7047741713) | Pending review |
| [@hipotures](https://github.com/hipotures) | [M016244](https://github.com/rohanarun/alpoge-rh-replay/issues/614#issuecomment-7047747028) | Pending review |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M115271](https://github.com/rohanarun/alpoge-rh-replay/issues/615#issuecomment-7047748419) | Pending review |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M173717](https://github.com/rohanarun/alpoge-rh-replay/issues/620#issuecomment-7047750236) | Pending review |

<!-- pending-volunteers-end -->

### Reviewed builds

<!-- volunteers-start -->

| Contributor | Task | Modules | Review |
|---|---|---:|---|
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M000001](https://github.com/rohanarun/alpoge-rh-replay/issues/499#issuecomment-7047505210) | 1 | [Build evidence verified](evidence/volunteers/M000001.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M000003](https://github.com/rohanarun/alpoge-rh-replay/issues/452#issuecomment-7047381025) | 1 | [Build evidence verified](evidence/volunteers/M000003.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M000004](https://github.com/rohanarun/alpoge-rh-replay/issues/413#issuecomment-7047349062) | 1 | [Build evidence verified](evidence/volunteers/M000004.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M000005](https://github.com/rohanarun/alpoge-rh-replay/issues/432#issuecomment-7047356174) | 1 | [Build evidence verified](evidence/volunteers/M000005.json) |
| [@dgahelper](https://github.com/dgahelper) | [M000028](https://github.com/rohanarun/alpoge-rh-replay/issues/136#issuecomment-7046171466) | 1 | [Build evidence verified](evidence/volunteers/M000028.json) |
| [@varo6](https://github.com/varo6) | [M000756](https://github.com/rohanarun/alpoge-rh-replay/issues/157#issuecomment-7046169778) | 1 | [Build evidence verified](evidence/volunteers/M000756.json) |
| [@varo6](https://github.com/varo6) | [M000757](https://github.com/rohanarun/alpoge-rh-replay/issues/139#issuecomment-7046108657) | 1 | [Build evidence verified](evidence/volunteers/M000757.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M002164](https://github.com/rohanarun/alpoge-rh-replay/issues/198#issuecomment-7047062219) | 1 | [Build evidence verified](evidence/volunteers/M002164.json) |
| [@gabeldev](https://github.com/gabeldev) | [M002284](https://github.com/rohanarun/alpoge-rh-replay/issues/468#issuecomment-7047388113) | 1 | [Build evidence verified](evidence/volunteers/M002284.json) |
| [@gabeldev](https://github.com/gabeldev) | [M002614](https://github.com/rohanarun/alpoge-rh-replay/issues/507#issuecomment-7047498112) | 1 | [Build evidence verified](evidence/volunteers/M002614.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M002650](https://github.com/rohanarun/alpoge-rh-replay/issues/223#issuecomment-7047148243) | 1 | [Build evidence verified](evidence/volunteers/M002650.json) |
| [@SeriousRising](https://github.com/SeriousRising) | [M002998](https://github.com/rohanarun/alpoge-rh-replay/issues/124#issuecomment-7045969982) | 1 | [Build evidence verified](evidence/volunteers/M002998.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M003000](https://github.com/rohanarun/alpoge-rh-replay/issues/444#issuecomment-7047343855) | 1 | [Build evidence verified](evidence/volunteers/M003000.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M003246](https://github.com/rohanarun/alpoge-rh-replay/issues/520#issuecomment-7047535869) | 1 | [Build evidence verified](evidence/volunteers/M003246.json) |
| [@varo6](https://github.com/varo6) | [M003369](https://github.com/rohanarun/alpoge-rh-replay/issues/164#issuecomment-7046219921) | 1 | [Build evidence verified](evidence/volunteers/M003369.json) |
| [@DanieleCorso](https://github.com/DanieleCorso) | [M003371](https://github.com/rohanarun/alpoge-rh-replay/issues/144#issuecomment-7046484735) | 1 | [Build evidence verified](evidence/volunteers/M003371.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M003661](https://github.com/rohanarun/alpoge-rh-replay/issues/442#issuecomment-7047318347) | 1 | [Build evidence verified](evidence/volunteers/M003661.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M003823](https://github.com/rohanarun/alpoge-rh-replay/issues/542#issuecomment-7047563191) | 1 | [Build evidence verified](evidence/volunteers/M003823.json) |
| [@Wronskode](https://github.com/Wronskode) | [M003923](https://github.com/rohanarun/alpoge-rh-replay/issues/428#issuecomment-7047301507) | 1 | [Build evidence verified](evidence/volunteers/M003923.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M004039](https://github.com/rohanarun/alpoge-rh-replay/issues/225#issuecomment-7047181065) | 1 | [Build evidence verified](evidence/volunteers/M004039.json) |
| [@Paulee314](https://github.com/Paulee314) | [M004066](https://github.com/rohanarun/alpoge-rh-replay/issues/473#issuecomment-7047423325) | 1 | [Build evidence verified](evidence/volunteers/M004066.json) |
| [@DanieleCorso](https://github.com/DanieleCorso) | [M004133](https://github.com/rohanarun/alpoge-rh-replay/issues/146#issuecomment-7046485806) | 1 | [Build evidence verified](evidence/volunteers/M004133.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M004145](https://github.com/rohanarun/alpoge-rh-replay/issues/440#issuecomment-7047373889) | 1 | [Build evidence verified](evidence/volunteers/M004145.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M004343](https://github.com/rohanarun/alpoge-rh-replay/issues/532#issuecomment-7047556052) | 1 | [Build evidence verified](evidence/volunteers/M004343.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M004402](https://github.com/rohanarun/alpoge-rh-replay/issues/247#issuecomment-7047095658) | 1 | [Build evidence verified](evidence/volunteers/M004402.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M004411](https://github.com/rohanarun/alpoge-rh-replay/issues/347#issuecomment-7047193504) | 1 | [Build evidence verified](evidence/volunteers/M004411.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M004439](https://github.com/rohanarun/alpoge-rh-replay/issues/438#issuecomment-7047467164) | 1 | [Build evidence verified](evidence/volunteers/M004439.json) |
| [@gabeldev](https://github.com/gabeldev) | [M004445](https://github.com/rohanarun/alpoge-rh-replay/issues/284#issuecomment-7047097870) | 1 | [Build evidence verified](evidence/volunteers/M004445.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M004742](https://github.com/rohanarun/alpoge-rh-replay/issues/227#issuecomment-7047210335) | 1 | [Build evidence verified](evidence/volunteers/M004742.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M004779](https://github.com/rohanarun/alpoge-rh-replay/issues/443#issuecomment-7047406917) | 1 | [Build evidence verified](evidence/volunteers/M004779.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M004788](https://github.com/rohanarun/alpoge-rh-replay/issues/429#issuecomment-7047313977) | 1 | [Build evidence verified](evidence/volunteers/M004788.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M004824](https://github.com/rohanarun/alpoge-rh-replay/issues/406#issuecomment-7047224693) | 1 | [Build evidence verified](evidence/volunteers/M004824.json) |
| [@DanieleCorso](https://github.com/DanieleCorso) | [M004876](https://github.com/rohanarun/alpoge-rh-replay/issues/151#issuecomment-7046491574) | 1 | [Build evidence verified](evidence/volunteers/M004876.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M005057](https://github.com/rohanarun/alpoge-rh-replay/issues/512#issuecomment-7047562814) | 1 | [Build evidence verified](evidence/volunteers/M005057.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M006419](https://github.com/rohanarun/alpoge-rh-replay/issues/457#issuecomment-7047338996) | 1 | [Build evidence verified](evidence/volunteers/M006419.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M006421](https://github.com/rohanarun/alpoge-rh-replay/issues/441#issuecomment-7047432318) | 1 | [Build evidence verified](evidence/volunteers/M006421.json) |
| [@gabeldev](https://github.com/gabeldev) | [M006453](https://github.com/rohanarun/alpoge-rh-replay/issues/456#issuecomment-7047338443) | 1 | [Build evidence verified](evidence/volunteers/M006453.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M006455](https://github.com/rohanarun/alpoge-rh-replay/issues/450#issuecomment-7047455166) | 1 | [Build evidence verified](evidence/volunteers/M006455.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M015143](https://github.com/rohanarun/alpoge-rh-replay/issues/533#issuecomment-7047548536) | 1 | [Build evidence verified](evidence/volunteers/M015143.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M015316](https://github.com/rohanarun/alpoge-rh-replay/issues/549#issuecomment-7047582789) | 1 | [Build evidence verified](evidence/volunteers/M015316.json) |
| [@DanieleCorso](https://github.com/DanieleCorso) | [M016897](https://github.com/rohanarun/alpoge-rh-replay/issues/10#issuecomment-7045920937) | 1 | [Build evidence verified](evidence/volunteers/M016897.json) |
| [@Wronskode](https://github.com/Wronskode) | [M017275](https://github.com/rohanarun/alpoge-rh-replay/issues/408#issuecomment-7047242651) | 1 | [Build evidence verified](evidence/volunteers/M017275.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M018411](https://github.com/rohanarun/alpoge-rh-replay/issues/425#issuecomment-7047277261) | 1 | [Build evidence verified](evidence/volunteers/M018411.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M019643](https://github.com/rohanarun/alpoge-rh-replay/issues/357#issuecomment-7047201486) | 1 | [Build evidence verified](evidence/volunteers/M019643.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M019662](https://github.com/rohanarun/alpoge-rh-replay/issues/544#issuecomment-7047568478) | 1 | [Build evidence verified](evidence/volunteers/M019662.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M019803](https://github.com/rohanarun/alpoge-rh-replay/issues/458#issuecomment-7047342904) | 1 | [Build evidence verified](evidence/volunteers/M019803.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M021051](https://github.com/rohanarun/alpoge-rh-replay/issues/521#issuecomment-7047535723) | 1 | [Build evidence verified](evidence/volunteers/M021051.json) |
| [@emsi](https://github.com/emsi) | [M026358](https://github.com/rohanarun/alpoge-rh-replay/issues/490#issuecomment-7047547967) | 1 | [Build evidence verified](evidence/volunteers/M026358.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M033875](https://github.com/rohanarun/alpoge-rh-replay/issues/455#issuecomment-7047454127) | 1 | [Build evidence verified](evidence/volunteers/M033875.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M037368](https://github.com/rohanarun/alpoge-rh-replay/issues/282#issuecomment-7047094419) | 1 | [Build evidence verified](evidence/volunteers/M037368.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M037677](https://github.com/rohanarun/alpoge-rh-replay/issues/229#issuecomment-7047209766) | 1 | [Build evidence verified](evidence/volunteers/M037677.json) |
| [@gabeldev](https://github.com/gabeldev) | [M038888](https://github.com/rohanarun/alpoge-rh-replay/issues/277#issuecomment-7047066157) | 1 | [Build evidence verified](evidence/volunteers/M038888.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M039604](https://github.com/rohanarun/alpoge-rh-replay/issues/431#issuecomment-7047313867) | 1 | [Build evidence verified](evidence/volunteers/M039604.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M041670](https://github.com/rohanarun/alpoge-rh-replay/issues/489#issuecomment-7047445369) | 1 | [Build evidence verified](evidence/volunteers/M041670.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M044508](https://github.com/rohanarun/alpoge-rh-replay/issues/445#issuecomment-7047406451) | 1 | [Build evidence verified](evidence/volunteers/M044508.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M053214](https://github.com/rohanarun/alpoge-rh-replay/issues/527#issuecomment-7047541568) | 1 | [Build evidence verified](evidence/volunteers/M053214.json) |
| [@gabeldev](https://github.com/gabeldev) | [M053490](https://github.com/rohanarun/alpoge-rh-replay/issues/355#issuecomment-7047232735) | 1 | [Build evidence verified](evidence/volunteers/M053490.json) |
| [@gabeldev](https://github.com/gabeldev) | [M055516](https://github.com/rohanarun/alpoge-rh-replay/issues/479#issuecomment-7047408508) | 1 | [Build evidence verified](evidence/volunteers/M055516.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M056441](https://github.com/rohanarun/alpoge-rh-replay/issues/446#issuecomment-7047317643) | 1 | [Build evidence verified](evidence/volunteers/M056441.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M060527](https://github.com/rohanarun/alpoge-rh-replay/issues/525#issuecomment-7047562566) | 1 | [Build evidence verified](evidence/volunteers/M060527.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M060556](https://github.com/rohanarun/alpoge-rh-replay/issues/534#issuecomment-7047555462) | 1 | [Build evidence verified](evidence/volunteers/M060556.json) |
| [@DanieleCorso](https://github.com/DanieleCorso) | [M062129](https://github.com/rohanarun/alpoge-rh-replay/issues/147#issuecomment-7046486614) | 1 | [Build evidence verified](evidence/volunteers/M062129.json) |
| [@maddoxjack](https://github.com/maddoxjack) | [M062705](https://github.com/rohanarun/alpoge-rh-replay/issues/410#issuecomment-7047417775) | 1 | [Build evidence verified](evidence/volunteers/M062705.json) |
| [@gabeldev](https://github.com/gabeldev) | [M066012](https://github.com/rohanarun/alpoge-rh-replay/issues/539#issuecomment-7047554536) | 1 | [Build evidence verified](evidence/volunteers/M066012.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M066213](https://github.com/rohanarun/alpoge-rh-replay/issues/505#issuecomment-7047511768) | 1 | [Build evidence verified](evidence/volunteers/M066213.json) |
| [@gabeldev](https://github.com/gabeldev) | [M066450](https://github.com/rohanarun/alpoge-rh-replay/issues/462#issuecomment-7047360435) | 1 | [Build evidence verified](evidence/volunteers/M066450.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M070564](https://github.com/rohanarun/alpoge-rh-replay/issues/524#issuecomment-7047562768) | 1 | [Build evidence verified](evidence/volunteers/M070564.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M071746](https://github.com/rohanarun/alpoge-rh-replay/issues/506#issuecomment-7047511171) | 1 | [Build evidence verified](evidence/volunteers/M071746.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M072099](https://github.com/rohanarun/alpoge-rh-replay/issues/508#issuecomment-7047589653) | 1 | [Build evidence verified](evidence/volunteers/M072099.json) |
| [@gabeldev](https://github.com/gabeldev) | [M072145](https://github.com/rohanarun/alpoge-rh-replay/issues/287#issuecomment-7047114764) | 1 | [Build evidence verified](evidence/volunteers/M072145.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M075156](https://github.com/rohanarun/alpoge-rh-replay/issues/537#issuecomment-7047557869) | 1 | [Build evidence verified](evidence/volunteers/M075156.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M075632](https://github.com/rohanarun/alpoge-rh-replay/issues/502#issuecomment-7047504936) | 1 | [Build evidence verified](evidence/volunteers/M075632.json) |
| [@gabeldev](https://github.com/gabeldev) | [M075849](https://github.com/rohanarun/alpoge-rh-replay/issues/547#issuecomment-7047571657) | 1 | [Build evidence verified](evidence/volunteers/M075849.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M076498](https://github.com/rohanarun/alpoge-rh-replay/issues/526#issuecomment-7047589670) | 1 | [Build evidence verified](evidence/volunteers/M076498.json) |
| [@TVSuchty](https://github.com/TVSuchty) | [M080008](https://github.com/rohanarun/alpoge-rh-replay/issues/86#issuecomment-7045864795) | 1 | [Build evidence verified](evidence/volunteers/M080008.json) |
| [@TVSuchty](https://github.com/TVSuchty) | [M080009](https://github.com/rohanarun/alpoge-rh-replay/issues/138#issuecomment-7046218293) | 1 | [Build evidence verified](evidence/volunteers/M080009.json) |
| [@gabeldev](https://github.com/gabeldev) | [M081419](https://github.com/rohanarun/alpoge-rh-replay/issues/552#issuecomment-7047593720) | 1 | [Build evidence verified](evidence/volunteers/M081419.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M081949](https://github.com/rohanarun/alpoge-rh-replay/issues/435#issuecomment-7047406653) | 1 | [Build evidence verified](evidence/volunteers/M081949.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M100792](https://github.com/rohanarun/alpoge-rh-replay/issues/430#issuecomment-7047313537) | 1 | [Build evidence verified](evidence/volunteers/M100792.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M100838](https://github.com/rohanarun/alpoge-rh-replay/issues/221#issuecomment-7047147575) | 1 | [Build evidence verified](evidence/volunteers/M100838.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M100842](https://github.com/rohanarun/alpoge-rh-replay/issues/219#issuecomment-7047118577) | 1 | [Build evidence verified](evidence/volunteers/M100842.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M101047](https://github.com/rohanarun/alpoge-rh-replay/issues/436#issuecomment-7047375174) | 1 | [Build evidence verified](evidence/volunteers/M101047.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M101079](https://github.com/rohanarun/alpoge-rh-replay/issues/226#issuecomment-7047180646) | 1 | [Build evidence verified](evidence/volunteers/M101079.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M101080](https://github.com/rohanarun/alpoge-rh-replay/issues/222#issuecomment-7047150416) | 1 | [Build evidence verified](evidence/volunteers/M101080.json) |
| [@Wronskode](https://github.com/Wronskode) | [M101325](https://github.com/rohanarun/alpoge-rh-replay/issues/274#issuecomment-7047137132) | 1 | [Build evidence verified](evidence/volunteers/M101325.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M101429](https://github.com/rohanarun/alpoge-rh-replay/issues/528#issuecomment-7047589506) | 1 | [Build evidence verified](evidence/volunteers/M101429.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M101527](https://github.com/rohanarun/alpoge-rh-replay/issues/466#issuecomment-7047373917) | 1 | [Build evidence verified](evidence/volunteers/M101527.json) |
| [@DanieleCorso](https://github.com/DanieleCorso) | [M101624](https://github.com/rohanarun/alpoge-rh-replay/issues/159#issuecomment-7046492175) | 1 | [Build evidence verified](evidence/volunteers/M101624.json) |
| [@user42245](https://github.com/user42245) | [M102943](https://github.com/rohanarun/alpoge-rh-replay/issues/239#issuecomment-7047092708) | 1 | [Build evidence verified](evidence/volunteers/M102943.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M102980](https://github.com/rohanarun/alpoge-rh-replay/issues/459#issuecomment-7047354307) | 1 | [Build evidence verified](evidence/volunteers/M102980.json) |
| [@DanieleCorso](https://github.com/DanieleCorso) | [M103332](https://github.com/rohanarun/alpoge-rh-replay/issues/143#issuecomment-7046484168) | 1 | [Build evidence verified](evidence/volunteers/M103332.json) |
| [@Genius-Cai-wen-zheng](https://github.com/Genius-Cai-wen-zheng) | [M103506](https://github.com/rohanarun/alpoge-rh-replay/issues/126#issuecomment-7045987064) | 1 | [Build evidence verified](evidence/volunteers/M103506.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M104576](https://github.com/rohanarun/alpoge-rh-replay/issues/461#issuecomment-7047361580) | 1 | [Build evidence verified](evidence/volunteers/M104576.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M104579](https://github.com/rohanarun/alpoge-rh-replay/issues/403#issuecomment-7047224614) | 1 | [Build evidence verified](evidence/volunteers/M104579.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M104675](https://github.com/rohanarun/alpoge-rh-replay/issues/465#issuecomment-7047366151) | 1 | [Build evidence verified](evidence/volunteers/M104675.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M106654](https://github.com/rohanarun/alpoge-rh-replay/issues/218#issuecomment-7047090799) | 1 | [Build evidence verified](evidence/volunteers/M106654.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M107338](https://github.com/rohanarun/alpoge-rh-replay/issues/447#issuecomment-7047343971) | 1 | [Build evidence verified](evidence/volunteers/M107338.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M108181](https://github.com/rohanarun/alpoge-rh-replay/issues/224#issuecomment-7047179528) | 1 | [Build evidence verified](evidence/volunteers/M108181.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M108353](https://github.com/rohanarun/alpoge-rh-replay/issues/467#issuecomment-7047381222) | 1 | [Build evidence verified](evidence/volunteers/M108353.json) |
| [@DanieleCorso](https://github.com/DanieleCorso) | [M108533](https://github.com/rohanarun/alpoge-rh-replay/issues/149#issuecomment-7046487953) | 1 | [Build evidence verified](evidence/volunteers/M108533.json) |
| [@emsi](https://github.com/emsi) | [M111837](https://github.com/rohanarun/alpoge-rh-replay/issues/509#issuecomment-7047600540) | 1 | [Build evidence verified](evidence/volunteers/M111837.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M115046](https://github.com/rohanarun/alpoge-rh-replay/issues/492#issuecomment-7047445578) | 1 | [Build evidence verified](evidence/volunteers/M115046.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M115870](https://github.com/rohanarun/alpoge-rh-replay/issues/411#issuecomment-7047243832) | 1 | [Build evidence verified](evidence/volunteers/M115870.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M115924](https://github.com/rohanarun/alpoge-rh-replay/issues/472#issuecomment-7047386703) | 1 | [Build evidence verified](evidence/volunteers/M115924.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M116295](https://github.com/rohanarun/alpoge-rh-replay/issues/503#issuecomment-7047505244) | 1 | [Build evidence verified](evidence/volunteers/M116295.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M116344](https://github.com/rohanarun/alpoge-rh-replay/issues/291#issuecomment-7047145612) | 1 | [Build evidence verified](evidence/volunteers/M116344.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M116516](https://github.com/rohanarun/alpoge-rh-replay/issues/217#issuecomment-7047118713) | 1 | [Build evidence verified](evidence/volunteers/M116516.json) |
| [@gabeldev](https://github.com/gabeldev) | [M117317](https://github.com/rohanarun/alpoge-rh-replay/issues/156#issuecomment-7046204159) | 1 | [Build evidence verified](evidence/volunteers/M117317.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M119655](https://github.com/rohanarun/alpoge-rh-replay/issues/433#issuecomment-7047343899) | 1 | [Build evidence verified](evidence/volunteers/M119655.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M119671](https://github.com/rohanarun/alpoge-rh-replay/issues/185#issuecomment-7047062317) | 1 | [Build evidence verified](evidence/volunteers/M119671.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M119679](https://github.com/rohanarun/alpoge-rh-replay/issues/220#issuecomment-7047118785) | 1 | [Build evidence verified](evidence/volunteers/M119679.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M119742](https://github.com/rohanarun/alpoge-rh-replay/issues/320#issuecomment-7047172996) | 1 | [Build evidence verified](evidence/volunteers/M119742.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M119805](https://github.com/rohanarun/alpoge-rh-replay/issues/550#issuecomment-7047589738) | 1 | [Build evidence verified](evidence/volunteers/M119805.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M119836](https://github.com/rohanarun/alpoge-rh-replay/issues/230#issuecomment-7047233234) | 1 | [Build evidence verified](evidence/volunteers/M119836.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M123625](https://github.com/rohanarun/alpoge-rh-replay/issues/453#issuecomment-7047454999) | 1 | [Build evidence verified](evidence/volunteers/M123625.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M125803](https://github.com/rohanarun/alpoge-rh-replay/issues/197#issuecomment-7047062342) | 1 | [Build evidence verified](evidence/volunteers/M125803.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M127069](https://github.com/rohanarun/alpoge-rh-replay/issues/504#issuecomment-7047511907) | 1 | [Build evidence verified](evidence/volunteers/M127069.json) |
| [@gabeldev](https://github.com/gabeldev) | [M127286](https://github.com/rohanarun/alpoge-rh-replay/issues/290#issuecomment-7047136576) | 1 | [Build evidence verified](evidence/volunteers/M127286.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M127723](https://github.com/rohanarun/alpoge-rh-replay/issues/454#issuecomment-7047328789) | 1 | [Build evidence verified](evidence/volunteers/M127723.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M127968](https://github.com/rohanarun/alpoge-rh-replay/issues/412#issuecomment-7047246358) | 1 | [Build evidence verified](evidence/volunteers/M127968.json) |
| [@gabeldev](https://github.com/gabeldev) | [M129533](https://github.com/rohanarun/alpoge-rh-replay/issues/487#issuecomment-7047429842) | 1 | [Build evidence verified](evidence/volunteers/M129533.json) |
| [@gabeldev](https://github.com/gabeldev) | [M132081](https://github.com/rohanarun/alpoge-rh-replay/issues/495#issuecomment-7047448834) | 1 | [Build evidence verified](evidence/volunteers/M132081.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M133332](https://github.com/rohanarun/alpoge-rh-replay/issues/517#issuecomment-7047535181) | 1 | [Build evidence verified](evidence/volunteers/M133332.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M137896](https://github.com/rohanarun/alpoge-rh-replay/issues/437#issuecomment-7047430547) | 1 | [Build evidence verified](evidence/volunteers/M137896.json) |
| [@gabeldev](https://github.com/gabeldev) | [M139092](https://github.com/rohanarun/alpoge-rh-replay/issues/522#issuecomment-7047517103) | 1 | [Build evidence verified](evidence/volunteers/M139092.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M139122](https://github.com/rohanarun/alpoge-rh-replay/issues/365#issuecomment-7047199840) | 1 | [Build evidence verified](evidence/volunteers/M139122.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M139326](https://github.com/rohanarun/alpoge-rh-replay/issues/529#issuecomment-7047539974) | 1 | [Build evidence verified](evidence/volunteers/M139326.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M140366](https://github.com/rohanarun/alpoge-rh-replay/issues/475#issuecomment-7047398735) | 1 | [Build evidence verified](evidence/volunteers/M140366.json) |
| [@Wronskode](https://github.com/Wronskode) | [M140982](https://github.com/rohanarun/alpoge-rh-replay/issues/339#issuecomment-7047202040) | 1 | [Build evidence verified](evidence/volunteers/M140982.json) |
| [@DanieleCorso](https://github.com/DanieleCorso) | [M141426](https://github.com/rohanarun/alpoge-rh-replay/issues/148#issuecomment-7046487357) | 1 | [Build evidence verified](evidence/volunteers/M141426.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M141510](https://github.com/rohanarun/alpoge-rh-replay/issues/463#issuecomment-7047361961) | 1 | [Build evidence verified](evidence/volunteers/M141510.json) |
| [@gabeldev](https://github.com/gabeldev) | [M141757](https://github.com/rohanarun/alpoge-rh-replay/issues/501#issuecomment-7047472389) | 1 | [Build evidence verified](evidence/volunteers/M141757.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M141904](https://github.com/rohanarun/alpoge-rh-replay/issues/551#issuecomment-7047596488) | 1 | [Build evidence verified](evidence/volunteers/M141904.json) |
| [@arxhr007](https://github.com/arxhr007) | [M144073](https://github.com/rohanarun/alpoge-rh-replay/issues/420#issuecomment-7047503983) | 1 | [Build evidence verified](evidence/volunteers/M144073.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M149215](https://github.com/rohanarun/alpoge-rh-replay/issues/216#issuecomment-7047090981) | 1 | [Build evidence verified](evidence/volunteers/M149215.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M149216](https://github.com/rohanarun/alpoge-rh-replay/issues/231#issuecomment-7047233084) | 1 | [Build evidence verified](evidence/volunteers/M149216.json) |
| [@gabeldev](https://github.com/gabeldev) | [M149422](https://github.com/rohanarun/alpoge-rh-replay/issues/283#issuecomment-7047082284) | 1 | [Build evidence verified](evidence/volunteers/M149422.json) |
| [@gabeldev](https://github.com/gabeldev) | [M149879](https://github.com/rohanarun/alpoge-rh-replay/issues/415#issuecomment-7047258125) | 1 | [Build evidence verified](evidence/volunteers/M149879.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M150069](https://github.com/rohanarun/alpoge-rh-replay/issues/275#issuecomment-7047211147) | 1 | [Build evidence verified](evidence/volunteers/M150069.json) |
| [@arxhr007](https://github.com/arxhr007) | [M150648](https://github.com/rohanarun/alpoge-rh-replay/issues/423#issuecomment-7047508173) | 1 | [Build evidence verified](evidence/volunteers/M150648.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M153029](https://github.com/rohanarun/alpoge-rh-replay/issues/494#issuecomment-7047448760) | 1 | [Build evidence verified](evidence/volunteers/M153029.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M153358](https://github.com/rohanarun/alpoge-rh-replay/issues/482#issuecomment-7047415727) | 1 | [Build evidence verified](evidence/volunteers/M153358.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M153503](https://github.com/rohanarun/alpoge-rh-replay/issues/546#issuecomment-7047580792) | 1 | [Build evidence verified](evidence/volunteers/M153503.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M153518](https://github.com/rohanarun/alpoge-rh-replay/issues/500#issuecomment-7047498583) | 1 | [Build evidence verified](evidence/volunteers/M153518.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M153527](https://github.com/rohanarun/alpoge-rh-replay/issues/496#issuecomment-7047453620) | 1 | [Build evidence verified](evidence/volunteers/M153527.json) |
| [@unhingedpanda](https://github.com/unhingedpanda) | [M153552](https://github.com/rohanarun/alpoge-rh-replay/issues/497#issuecomment-7047572763) | 1 | [Build evidence verified](evidence/volunteers/M153552.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M153589](https://github.com/rohanarun/alpoge-rh-replay/issues/476#issuecomment-7047403560) | 1 | [Build evidence verified](evidence/volunteers/M153589.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M153591](https://github.com/rohanarun/alpoge-rh-replay/issues/548#issuecomment-7047576332) | 1 | [Build evidence verified](evidence/volunteers/M153591.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M153593](https://github.com/rohanarun/alpoge-rh-replay/issues/407#issuecomment-7047228275) | 1 | [Build evidence verified](evidence/volunteers/M153593.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M153598](https://github.com/rohanarun/alpoge-rh-replay/issues/286#issuecomment-7047120665) | 1 | [Build evidence verified](evidence/volunteers/M153598.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M153621](https://github.com/rohanarun/alpoge-rh-replay/issues/449#issuecomment-7047329268) | 1 | [Build evidence verified](evidence/volunteers/M153621.json) |
| [@gabeldev](https://github.com/gabeldev) | [M154068](https://github.com/rohanarun/alpoge-rh-replay/issues/307#issuecomment-7047163938) | 1 | [Build evidence verified](evidence/volunteers/M154068.json) |
| [@unhingedpanda](https://github.com/unhingedpanda) | [M154073](https://github.com/rohanarun/alpoge-rh-replay/issues/288#issuecomment-7047359947) | 1 | [Build evidence verified](evidence/volunteers/M154073.json) |
| [@arxhr007](https://github.com/arxhr007) | [M154127](https://github.com/rohanarun/alpoge-rh-replay/issues/422#issuecomment-7047505979) | 1 | [Build evidence verified](evidence/volunteers/M154127.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M156796](https://github.com/rohanarun/alpoge-rh-replay/issues/483#issuecomment-7047421591) | 1 | [Build evidence verified](evidence/volunteers/M156796.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M157865](https://github.com/rohanarun/alpoge-rh-replay/issues/373#issuecomment-7047211943) | 1 | [Build evidence verified](evidence/volunteers/M157865.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M161799](https://github.com/rohanarun/alpoge-rh-replay/issues/523#issuecomment-7047525205) | 1 | [Build evidence verified](evidence/volunteers/M161799.json) |
| [@gniax](https://github.com/gniax) | [M161831](https://github.com/rohanarun/alpoge-rh-replay/issues/280#issuecomment-7047126899) | 1 | [Build evidence verified](evidence/volunteers/M161831.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M161836](https://github.com/rohanarun/alpoge-rh-replay/issues/448#issuecomment-7047374305) | 1 | [Build evidence verified](evidence/volunteers/M161836.json) |
| [@gabeldev](https://github.com/gabeldev) | [M161840](https://github.com/rohanarun/alpoge-rh-replay/issues/427#issuecomment-7047284445) | 1 | [Build evidence verified](evidence/volunteers/M161840.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M162408](https://github.com/rohanarun/alpoge-rh-replay/issues/485#issuecomment-7047432177) | 1 | [Build evidence verified](evidence/volunteers/M162408.json) |
| [@hipotures](https://github.com/hipotures) | [M163043](https://github.com/rohanarun/alpoge-rh-replay/issues/541#issuecomment-7047573917) | 1 | [Build evidence verified](evidence/volunteers/M163043.json) |
| [@DanieleCorso](https://github.com/DanieleCorso) | [M163942](https://github.com/rohanarun/alpoge-rh-replay/issues/145#issuecomment-7046485257) | 1 | [Build evidence verified](evidence/volunteers/M163942.json) |
| [@DanieleCorso](https://github.com/DanieleCorso) | [M164962](https://github.com/rohanarun/alpoge-rh-replay/issues/150#issuecomment-7046491107) | 1 | [Build evidence verified](evidence/volunteers/M164962.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M168066](https://github.com/rohanarun/alpoge-rh-replay/issues/414#issuecomment-7047252079) | 1 | [Build evidence verified](evidence/volunteers/M168066.json) |
| [@Paulee314](https://github.com/Paulee314) | [M168067](https://github.com/rohanarun/alpoge-rh-replay/issues/477#issuecomment-7047442237) | 1 | [Build evidence verified](evidence/volunteers/M168067.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M169429](https://github.com/rohanarun/alpoge-rh-replay/issues/228#issuecomment-7047210594) | 1 | [Build evidence verified](evidence/volunteers/M169429.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M169517](https://github.com/rohanarun/alpoge-rh-replay/issues/553#issuecomment-7047597566) | 1 | [Build evidence verified](evidence/volunteers/M169517.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M169761](https://github.com/rohanarun/alpoge-rh-replay/issues/480#issuecomment-7047409129) | 1 | [Build evidence verified](evidence/volunteers/M169761.json) |
| [@surfyhou](https://github.com/surfyhou) | [M170887](https://github.com/rohanarun/alpoge-rh-replay/issues/5#issuecomment-7044980759) | 1 | [Build evidence verified](evidence/volunteers/M170887.json) |
| [@arxhr007](https://github.com/arxhr007) | [M171103](https://github.com/rohanarun/alpoge-rh-replay/issues/141#issuecomment-7046656867) | 1 | [Build evidence verified](evidence/volunteers/M171103.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M171564](https://github.com/rohanarun/alpoge-rh-replay/issues/418#issuecomment-7047262461) | 1 | [Build evidence verified](evidence/volunteers/M171564.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M171874](https://github.com/rohanarun/alpoge-rh-replay/issues/424#issuecomment-7047266733) | 1 | [Build evidence verified](evidence/volunteers/M171874.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [M173481](https://github.com/rohanarun/alpoge-rh-replay/issues/439#issuecomment-7047430081) | 1 | [Build evidence verified](evidence/volunteers/M173481.json) |
| [@Amahane-Hikari](https://github.com/Amahane-Hikari) | [M173531](https://github.com/rohanarun/alpoge-rh-replay/issues/498#issuecomment-7047498513) | 1 | [Build evidence verified](evidence/volunteers/M173531.json) |
| [@JanSimeonMetzger](https://github.com/JanSimeonMetzger) | [P0012](https://github.com/rohanarun/alpoge-rh-replay/issues/1#issuecomment-7044609913) | 64 | [Build evidence verified](evidence/volunteers/P0012.json) |
| [@JanSimeonMetzger](https://github.com/JanSimeonMetzger) | [P0020](https://github.com/rohanarun/alpoge-rh-replay/issues/2#issuecomment-7044751121) | 64 | [Build evidence verified](evidence/volunteers/P0020.json) |
| [@JanSimeonMetzger](https://github.com/JanSimeonMetzger) | [P0021](https://github.com/rohanarun/alpoge-rh-replay/issues/3#issuecomment-7044905860) | 64 | [Build evidence verified](evidence/volunteers/P0021.json) |
| [@JanSimeonMetzger](https://github.com/JanSimeonMetzger) | [P0041](https://github.com/rohanarun/alpoge-rh-replay/issues/6#issuecomment-7045037425) | 64 | [Build evidence verified](evidence/volunteers/P0041.json) |
| [@krisyotam](https://github.com/krisyotam) | [P0060](https://github.com/rohanarun/alpoge-rh-replay/issues/7#issuecomment-7045297630) | 64 | [Build evidence verified](evidence/volunteers/P0060.json) |
| [@JanSimeonMetzger](https://github.com/JanSimeonMetzger) | [P0061](https://github.com/rohanarun/alpoge-rh-replay/issues/8#issuecomment-7045174078) | 64 | [Build evidence verified](evidence/volunteers/P0061.json) |
| [@JanSimeonMetzger](https://github.com/JanSimeonMetzger) | [P0064](https://github.com/rohanarun/alpoge-rh-replay/issues/9#issuecomment-7045329594) | 64 | [Build evidence verified](evidence/volunteers/P0064.json) |
| [@DanieleCorso](https://github.com/DanieleCorso) | [P0103](https://github.com/rohanarun/alpoge-rh-replay/issues/11#issuecomment-7046400741) | 64 | [Build evidence verified](evidence/volunteers/P0103.json) |
| [@juanfers1](https://github.com/juanfers1) | [P0104](https://github.com/rohanarun/alpoge-rh-replay/issues/12#issuecomment-7045481960) | 64 | [Build evidence verified](evidence/volunteers/P0104.json) |
| [@gabeldev](https://github.com/gabeldev) | [P0108](https://github.com/rohanarun/alpoge-rh-replay/issues/14#issuecomment-7045548766) | 64 | [Build evidence verified](evidence/volunteers/P0108.json) |
| [@JanSimeonMetzger](https://github.com/JanSimeonMetzger) | [P0111](https://github.com/rohanarun/alpoge-rh-replay/issues/15#issuecomment-7045474203) | 64 | [Build evidence verified](evidence/volunteers/P0111.json) |
| [@JanSimeonMetzger](https://github.com/JanSimeonMetzger) | [P0113](https://github.com/rohanarun/alpoge-rh-replay/issues/18#issuecomment-7045681101) | 64 | [Build evidence verified](evidence/volunteers/P0113.json) |
| [@gabeldev](https://github.com/gabeldev) | [P0114](https://github.com/rohanarun/alpoge-rh-replay/issues/20#issuecomment-7045695171) | 64 | [Build evidence verified](evidence/volunteers/P0114.json) |
| [@krisyotam](https://github.com/krisyotam) | [P0125](https://github.com/rohanarun/alpoge-rh-replay/issues/88#issuecomment-7045913737) | 64 | [Build evidence verified](evidence/volunteers/P0125.json) |
| [@juanfers1](https://github.com/juanfers1) | [P0129](https://github.com/rohanarun/alpoge-rh-replay/issues/89#issuecomment-7045795333) | 64 | [Build evidence verified](evidence/volunteers/P0129.json) |
| [@BenCaunt](https://github.com/BenCaunt) | [P0145](https://github.com/rohanarun/alpoge-rh-replay/issues/16#issuecomment-7045833885) | 64 | [Build evidence verified](evidence/volunteers/P0145.json) |
| [@dgahelper](https://github.com/dgahelper) | [P0172](https://github.com/rohanarun/alpoge-rh-replay/issues/91#issuecomment-7045992035) | 64 | [Build evidence verified](evidence/volunteers/P0172.json) |
| [@gabeldev](https://github.com/gabeldev) | [P0178](https://github.com/rohanarun/alpoge-rh-replay/issues/96#issuecomment-7046079755) | 64 | [Build evidence verified](evidence/volunteers/P0178.json) |
| [@gabeldev](https://github.com/gabeldev) | [P0182](https://github.com/rohanarun/alpoge-rh-replay/issues/97#issuecomment-7046142068) | 64 | [Build evidence verified](evidence/volunteers/P0182.json) |
| [@shardmods](https://github.com/shardmods) | [P0191](https://github.com/rohanarun/alpoge-rh-replay/issues/100#issuecomment-7046158317) | 64 | [Build evidence verified](evidence/volunteers/P0191.json) |
| [@shardmods](https://github.com/shardmods) | [P0199](https://github.com/rohanarun/alpoge-rh-replay/issues/98#issuecomment-7046154029) | 64 | [Build evidence verified](evidence/volunteers/P0199.json) |
| [@JanSimeonMetzger](https://github.com/JanSimeonMetzger) | [P0209](https://github.com/rohanarun/alpoge-rh-replay/issues/95#issuecomment-7045938029) | 64 | [Build evidence verified](evidence/volunteers/P0209.json) |
| [@shardmods](https://github.com/shardmods) | [P0237](https://github.com/rohanarun/alpoge-rh-replay/issues/99#issuecomment-7046156582) | 64 | [Build evidence verified](evidence/volunteers/P0237.json) |
| [@JanSimeonMetzger](https://github.com/JanSimeonMetzger) | [P0254](https://github.com/rohanarun/alpoge-rh-replay/issues/94#issuecomment-7045929752) | 64 | [Build evidence verified](evidence/volunteers/P0254.json) |
| [@shardmods](https://github.com/shardmods) | [P0255](https://github.com/rohanarun/alpoge-rh-replay/issues/104#issuecomment-7046166397) | 64 | [Build evidence verified](evidence/volunteers/P0255.json) |
| [@shardmods](https://github.com/shardmods) | [P0256](https://github.com/rohanarun/alpoge-rh-replay/issues/103#issuecomment-7046164400) | 64 | [Build evidence verified](evidence/volunteers/P0256.json) |
| [@shardmods](https://github.com/shardmods) | [P0261](https://github.com/rohanarun/alpoge-rh-replay/issues/101#issuecomment-7046160215) | 64 | [Build evidence verified](evidence/volunteers/P0261.json) |
| [@JanSimeonMetzger](https://github.com/JanSimeonMetzger) | [P0287](https://github.com/rohanarun/alpoge-rh-replay/issues/92#issuecomment-7045860836) | 64 | [Build evidence verified](evidence/volunteers/P0287.json) |
| [@shardmods](https://github.com/shardmods) | [P0293](https://github.com/rohanarun/alpoge-rh-replay/issues/102#issuecomment-7046162412) | 64 | [Build evidence verified](evidence/volunteers/P0293.json) |
| [@shardmods](https://github.com/shardmods) | [P0300](https://github.com/rohanarun/alpoge-rh-replay/issues/113#issuecomment-7046252794) | 64 | [Build evidence verified](evidence/volunteers/P0300.json) |
| [@shardmods](https://github.com/shardmods) | [P0309](https://github.com/rohanarun/alpoge-rh-replay/issues/109#issuecomment-7046176449) | 64 | [Build evidence verified](evidence/volunteers/P0309.json) |
| [@shardmods](https://github.com/shardmods) | [P0311](https://github.com/rohanarun/alpoge-rh-replay/issues/105#issuecomment-7046168327) | 64 | [Build evidence verified](evidence/volunteers/P0311.json) |
| [@shardmods](https://github.com/shardmods) | [P0346](https://github.com/rohanarun/alpoge-rh-replay/issues/106#issuecomment-7046170429) | 64 | [Build evidence verified](evidence/volunteers/P0346.json) |
| [@shardmods](https://github.com/shardmods) | [P0392](https://github.com/rohanarun/alpoge-rh-replay/issues/108#issuecomment-7046174698) | 64 | [Build evidence verified](evidence/volunteers/P0392.json) |
| [@shardmods](https://github.com/shardmods) | [P0408](https://github.com/rohanarun/alpoge-rh-replay/issues/111#issuecomment-7046181111) | 64 | [Build evidence verified](evidence/volunteers/P0408.json) |
| [@shardmods](https://github.com/shardmods) | [P0419](https://github.com/rohanarun/alpoge-rh-replay/issues/118#issuecomment-7046257251) | 64 | [Build evidence verified](evidence/volunteers/P0419.json) |
| [@JanSimeonMetzger](https://github.com/JanSimeonMetzger) | [P0452](https://github.com/rohanarun/alpoge-rh-replay/issues/93#issuecomment-7045926387) | 64 | [Build evidence verified](evidence/volunteers/P0452.json) |
| [@juanfers1](https://github.com/juanfers1) | [P0476](https://github.com/rohanarun/alpoge-rh-replay/issues/127#issuecomment-7046093484) | 64 | [Build evidence verified](evidence/volunteers/P0476.json) |
| [@JanSimeonMetzger](https://github.com/JanSimeonMetzger) | [P0485](https://github.com/rohanarun/alpoge-rh-replay/issues/125#issuecomment-7046689906) | 64 | [Build evidence verified](evidence/volunteers/P0485.json) |
| [@shardmods](https://github.com/shardmods) | [P0494](https://github.com/rohanarun/alpoge-rh-replay/issues/112#issuecomment-7046182894) | 64 | [Build evidence verified](evidence/volunteers/P0494.json) |
| [@shardmods](https://github.com/shardmods) | [P0539](https://github.com/rohanarun/alpoge-rh-replay/issues/110#issuecomment-7046178996) | 64 | [Build evidence verified](evidence/volunteers/P0539.json) |
| [@shardmods](https://github.com/shardmods) | [P0558](https://github.com/rohanarun/alpoge-rh-replay/issues/114#issuecomment-7046255154) | 64 | [Build evidence verified](evidence/volunteers/P0558.json) |
| [@JanSimeonMetzger](https://github.com/JanSimeonMetzger) | [P0562](https://github.com/rohanarun/alpoge-rh-replay/issues/130#issuecomment-7046694327) | 64 | [Build evidence verified](evidence/volunteers/P0562.json) |
| [@shardmods](https://github.com/shardmods) | [P0595](https://github.com/rohanarun/alpoge-rh-replay/issues/107#issuecomment-7046172719) | 64 | [Build evidence verified](evidence/volunteers/P0595.json) |
| [@JanSimeonMetzger](https://github.com/JanSimeonMetzger) | [P0596](https://github.com/rohanarun/alpoge-rh-replay/issues/128#issuecomment-7046566514) | 64 | [Build evidence verified](evidence/volunteers/P0596.json) |
| [@shardmods](https://github.com/shardmods) | [P0628](https://github.com/rohanarun/alpoge-rh-replay/issues/115#issuecomment-7046297848) | 64 | [Build evidence verified](evidence/volunteers/P0628.json) |
| [@JanSimeonMetzger](https://github.com/JanSimeonMetzger) | [P0630](https://github.com/rohanarun/alpoge-rh-replay/issues/135#issuecomment-7046723994) | 64 | [Build evidence verified](evidence/volunteers/P0630.json) |
| [@JanSimeonMetzger](https://github.com/JanSimeonMetzger) | [P0659](https://github.com/rohanarun/alpoge-rh-replay/issues/134#issuecomment-7047082940) | 64 | [Build evidence verified](evidence/volunteers/P0659.json) |
| [@JanSimeonMetzger](https://github.com/JanSimeonMetzger) | [P0661](https://github.com/rohanarun/alpoge-rh-replay/issues/132#issuecomment-7046674165) | 64 | [Build evidence verified](evidence/volunteers/P0661.json) |
| [@JanSimeonMetzger](https://github.com/JanSimeonMetzger) | [P0744](https://github.com/rohanarun/alpoge-rh-replay/issues/133#issuecomment-7046804107) | 64 | [Build evidence verified](evidence/volunteers/P0744.json) |
| [@shardmods](https://github.com/shardmods) | [P0757](https://github.com/rohanarun/alpoge-rh-replay/issues/120#issuecomment-7046963832) | 64 | [Build evidence verified](evidence/volunteers/P0757.json) |
| [@shardmods](https://github.com/shardmods) | [P0766](https://github.com/rohanarun/alpoge-rh-replay/issues/121#issuecomment-7046260012) | 64 | [Build evidence verified](evidence/volunteers/P0766.json) |
| [@JanSimeonMetzger](https://github.com/JanSimeonMetzger) | [P0783](https://github.com/rohanarun/alpoge-rh-replay/issues/129#issuecomment-7046740555) | 64 | [Build evidence verified](evidence/volunteers/P0783.json) |
| [@shardmods](https://github.com/shardmods) | [P0794](https://github.com/rohanarun/alpoge-rh-replay/issues/116#issuecomment-7046403491) | 64 | [Build evidence verified](evidence/volunteers/P0794.json) |
| [@juanfers1](https://github.com/juanfers1) | [P0799](https://github.com/rohanarun/alpoge-rh-replay/issues/153#issuecomment-7046623779) | 64 | [Build evidence verified](evidence/volunteers/P0799.json) |
| [@shardmods](https://github.com/shardmods) | [P0820](https://github.com/rohanarun/alpoge-rh-replay/issues/119#issuecomment-7046299655) | 64 | [Build evidence verified](evidence/volunteers/P0820.json) |
| [@shardmods](https://github.com/shardmods) | [P0849](https://github.com/rohanarun/alpoge-rh-replay/issues/117#issuecomment-7046376924) | 64 | [Build evidence verified](evidence/volunteers/P0849.json) |
| [@SeriousRising](https://github.com/SeriousRising) | [P0866](https://github.com/rohanarun/alpoge-rh-replay/issues/235#issuecomment-7047545876) | 64 | [Build evidence verified](evidence/volunteers/P0866.json) |
| [@shardmods](https://github.com/shardmods) | [P1016](https://github.com/rohanarun/alpoge-rh-replay/issues/122#issuecomment-7046960866) | 64 | [Build evidence verified](evidence/volunteers/P1016.json) |
| [@SeriousRising](https://github.com/SeriousRising) | [P1058](https://github.com/rohanarun/alpoge-rh-replay/issues/140#issuecomment-7046460455) | 64 | [Build evidence verified](evidence/volunteers/P1058.json) |
| [@Genius-Cai-wen-zheng](https://github.com/Genius-Cai-wen-zheng) | [P1230](https://github.com/rohanarun/alpoge-rh-replay/issues/158#issuecomment-7047054079) | 64 | [Build evidence verified](evidence/volunteers/P1230.json) |
| [@shardmods](https://github.com/shardmods) | [P1274](https://github.com/rohanarun/alpoge-rh-replay/issues/186#issuecomment-7047507728) | 64 | [Build evidence verified](evidence/volunteers/P1274.json) |

<!-- volunteers-end -->

## Completed parts

<!-- completed-start -->

| Evidence for distinct module IDs | Count |
|---|---:|
| Successful source build observed | 5,515 |
| Pilot proof object reused | 150 |
| Pilot downstream module kernel-checked | 1 |
| Distributed proof object reused | 16,997 |
| Volunteer build evidence reviewed | 4,143 |
| **Total with recorded module evidence** | **26,806 / 175,187** |

[See each completed part and its evidence](completed/README.md) · [Machine-readable ledger](tracker/completed.tsv)

<!-- completed-end -->

## Give this prompt to an agent

> Help independently replay the claimed RH proof using https://github.com/rohanarun/alpoge-rh-replay. Read auto-research.md and fast-forward to the latest main commit. Run `python3 tracker/tasks.py next` and inspect an open packet. Claim exactly one open packet or module. Wait for the claim-granted label and matching bot comment before starting. Reproduce the pinned inputs, build the assigned targets and their required imports, and attach the receipt, log, and artifact hashes to your issue. If you stop, release the claim. Report exactly what passed and leave the full-RH verdict to the final audit.

[Full instructions for agents](auto-research.md) · [Claims and conflicts](https://github.com/rohanarun/alpoge-rh-replay/issues?q=is%3Aissue+is%3Aopen+in%3Atitle+Claim)

## Reproduce the check

On Linux, install the elan launcher and ensure its `lean` and `lake` commands are on your PATH. The script also requires Bash, Git, curl, GNU tar, sha256sum, a C toolchain, network access, and a large writable build volume. Run from this repository with a fresh output directory.

```bash
./verify.sh /path/to/empty/replay-directory
```

The script compares every archive part with its SHA-256 digest, checks the toolchain and mathlib revision, builds the final module from source, and writes the transcript to `replay.log` in the output directory. The pinned Lean compiler is 4.33.1 and the mathlib commit is `0df444a360eaa60ab8c11dca51a86af692955474`.

## Read the evidence

1. `REPLAY_SOURCE_BUILD_PASSED` means Lake built the module containing the final theorem.
2. `REPLAY_AXIOM_AUDIT_PASSED` means the five public theorems in `Main` type-checked against their statements, which `Audit.lean` writes out with Mathlib definitions only. The audit rejects any reported axiom beyond propositional extensionality, classical choice, and quotient soundness.
3. `REPLAY_FRESH_KERNEL_PASSED` means Lean’s checker replayed the declarations imported by `Main` in a fresh environment. It uses the same Lean kernel implementation.

A completed report should include the exit status, all three outputs, the printed theorem and axioms, and a checksum for the archived transcript. A machine or storage failure leaves the mathematical claim unresolved.

## Optional determinant check

The [M115707 example](examples/M115707/README.md) compares a shorter local Gram determinant argument with the published module. This check runs separately from the volunteer replay.

## Volunteer activity

![Cumulative chart of volunteers, granted claims, and replay submissions](tracker/activity.svg)

[How the chart is counted](ACTIVITY.md) · [Event data](tracker/activity.tsv)

## License

The original replay tooling and documentation in this repository are available under the [MIT License](LICENSE). Upstream Lean source, Mathlib, and third-party artifacts retain their respective licenses.

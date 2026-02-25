# Wave 4 Checkpoints — run-20260221-212859-est

Updated: 2026-02-22 01:41:19 EST

## Checkpoint A — Authority + pinning verification
- Result: **PASS**
- Verified artifacts:
  - `exec/command-authority.json`
  - `exec/command-authority-report.md`
- Verified facts:
  - Status locked: `LOCKED_APPROVED`.
  - Baseline/candidate/compare commands explicitly pinned.
  - Dataset/split/seed/limit/device/api-mode pinned.

## Checkpoint B1 — Baseline lane trigger
- Result: **FAIL / BLOCKED**
- Attempt 1:
  - Command: locked `python -m arag.eval.step1 ... --out-root .../baseline`
  - Exit: `127`
  - Error: `python: command not found`
- Attempt 2:
  - Command: `python3 -m arag.eval.step1 ... --out-root .../baseline`
  - Exit: `1`
  - Error: `ModuleNotFoundError: No module named 'arag'`

## Checkpoint B2 — Candidate lane trigger (parallel)
- Result: **FAIL / BLOCKED**
- Attempt 1:
  - Command: locked `python -m arag.eval.step1 ... --out-root .../candidate`
  - Exit: `127`
  - Error: `python: command not found`
- Attempt 2:
  - Command: `python3 -m arag.eval.step1 ... --out-root .../candidate`
  - Exit: `1`
  - Error: `ModuleNotFoundError: No module named 'arag'`

## Checkpoint C — Comparison trigger
- Result: **FAIL / BLOCKED**
- Attempt:
  - Command: `python3 -m arag.eval.compare ...`
  - Exit: `1`
  - Error: `ModuleNotFoundError: No module named 'arag'`

## Checkpoint D — Gate + decision report closure
- Result: **HOLD (safe downstream only)**
- Verified facts:
  - No new baseline/candidate normalized outputs were generated.
  - Comparison could not execute due to missing `arag` module runtime.
  - Final adjudication remains HOLD until runtime packaging + lane evidence are present.

## Blocker recorded (exact)
Runtime environment cannot execute approved evaluator commands on this host:
1. `python` executable unavailable.
2. `python3` present but evaluator package/module `arag` is not importable (`ModuleNotFoundError`).
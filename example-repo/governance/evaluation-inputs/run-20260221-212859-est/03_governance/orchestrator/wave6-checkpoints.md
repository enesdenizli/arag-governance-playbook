# Wave 6 Checkpoints — run-20260221-212859-est

## CP-A: Entry-point discovery at source pin
- Command: `git -C arag-working/arag-src ls-tree -r --name-only a44de6b... | rg '^scripts/(batch_runner|eval|build_index)\.py$|^src/arag/eval'`
- Result:
  - Found `scripts/batch_runner.py`, `scripts/eval.py`, `scripts/build_index.py`
  - Did **not** find `arag.eval.step1` or `arag.eval.compare`

## CP-B: Authority contract patch
- Updated:
  - `exec/command-authority.json`
  - `exec/command-authority-report.md`
  - `exec/baseline-command-packet.md`
  - `exec/candidate-command-packet.md`
- Preserved pinned invariants: run_id, dataset/split, seed, limit, device, embedding model path, API mode, profile/model mapping, output roots.

## CP-C1/C2: Parallel execution
- Baseline command launched (background): `batch_runner.py ... config-baseline.yaml ... --limit 10 --workers 4`
- Candidate command launched (background): `batch_runner.py ... config-candidate.yaml ... --limit 10 --workers 4`
- Both exited code 0.
- Outputs created:
  - `baseline/predictions.jsonl`
  - `candidate/predictions.jsonl`

## CP-D1: Lane evaluation
- Ran `scripts/eval.py` for baseline and candidate outputs.
- Both exited code 0.
- Summaries:
  - baseline: `answered=10/10`, `llm_accuracy=0.0`, `contain_accuracy=0.0`, `avg_loops=1.0`
  - candidate: `answered=10/10`, `llm_accuracy=0.0`, `contain_accuracy=0.0`, `avg_loops=1.0`

## CP-D2: Compare + gate closure
- Wrote refreshed:
  - `comparison/decision-input.json`
  - `comparison/verdict.json`
- Verdict: `COMPLETED_WITH_HOLD` / `HOLD` (tie on all measured metrics; no quality lift).
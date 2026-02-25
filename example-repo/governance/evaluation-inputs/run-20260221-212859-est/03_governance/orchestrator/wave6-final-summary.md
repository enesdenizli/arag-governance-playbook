# Wave 6 Final Summary — run-20260221-212859-est

Wave 6 objective is closed.

## What was accomplished
1. Verified the pinned upstream source commit exists locally at `arag-working/arag-src` (`a44de6b2216bf6791979c4b6ac4ae106212fa1a6`).
2. Confirmed command-contract mismatch root cause: authoritative modules `arag.eval.step1` / `arag.eval.compare` are absent at the pinned commit.
3. Reconciled command authority to real entrypoints in the pinned source (`scripts/batch_runner.py`, `scripts/eval.py`) while preserving locked inputs.
4. Executed baseline and candidate lanes in parallel (step-1 limited, limit=10) and produced prediction artifacts in run-local baseline/candidate directories.
5. Executed lane evaluations and refreshed comparison/gate outputs.

## Key evidence
- Reconciled authority: `exec/command-authority.json` and command packets.
- Runtime outputs:
  - `baseline/predictions.jsonl`, `baseline/predictions_eval_summary.json`
  - `candidate/predictions.jsonl`, `candidate/predictions_eval_summary.json`
- Comparison + verdict:
  - `comparison/decision-input.json`
  - `comparison/verdict.json`

## Outcome
- Run status: **COMPLETED_WITH_HOLD**
- Gate decision: **HOLD**
- Basis: both lanes executed successfully at process level, but produced non-passing quality signal (`llm_accuracy=0.0`, `contain_accuracy=0.0` for both; no improvement delta).

## Notes for requester
- This wave resolved the **contract mismatch blocker** and completed end-to-end execution/reporting.
- Remaining issue is now **model-quality/runtime behavior**, not missing harness entrypoints.
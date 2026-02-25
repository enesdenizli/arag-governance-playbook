# Wave 6 State Board — run-20260221-212859-est

## Objective
Resolve command contract mismatch, run C1 baseline + C2 candidate in parallel, then compare/gate closure using evidence only.

## DAG Status
- A) Discover real entrypoints at pinned commit `a44de6b2216bf6791979c4b6ac4ae106212fa1a6`: **DONE**
- B) Patch authority commands preserving pinned inputs: **DONE**
- C1) Baseline execution: **DONE**
- C2) Candidate execution: **DONE**
- D) Compare/gate/report closure: **DONE**

## Evidence snapshots
- Pinned commit present locally:
  - `git -C arag-working/arag-src show --no-patch --oneline a44de6b...`
- Real CLI entrypoints at pin:
  - `scripts/batch_runner.py`
  - `scripts/eval.py`
  - (no `src/arag/eval/step1.py`, no `arag.eval.compare` module)
- Reconciled authority artifacts:
  - `exec/command-authority.json`
  - `exec/command-authority-report.md`
  - `exec/baseline-command-packet.md`
  - `exec/candidate-command-packet.md`
- Parallel lane execution outputs:
  - `baseline/predictions.jsonl`
  - `candidate/predictions.jsonl`
- Lane eval summaries:
  - `baseline/predictions_eval_summary.json`
  - `candidate/predictions_eval_summary.json`
- Comparison/gate outputs:
  - `comparison/decision-input.json`
  - `comparison/verdict.json`

## Current run disposition
**COMPLETED_WITH_HOLD** (executions completed; quality signal non-improving/non-passing).
# Candidate Artifact Manifest

- run_id: `run-20260221-212859-est`
- lane: `candidate`
- generated_at_utc: `2026-02-22T09:45:00Z`
- status: `complete_with_blocked_authority_command`

## Provenance/Citation Checklist

- [x] `predictions.jsonl` present (`10` records)
- [x] `predictions_eval_summary.json` present (`answered_samples=10`, `failed_samples=0`)
- [x] `provenance-summary.json` present with required keys: `coverage_rate`, `missing_citation_rate`, `invalid_citation_rate`, `notes`
- [x] `execution-log.md` records blocked authority command (`ModuleNotFoundError: arag.eval`) and artifact-derived outcomes
- [x] Latest eval rerun evidence reconciled (`candidate/logs/candidate-eval-rerun-20260222-043639.log`) to resolve stale older `candidate/eval-rerun.log`

## Reconciled values (fresh outputs)

- citation coverage rate: `0.6`
- missing citation rate: `0.4`
- invalid citation rate: `0.1`
- answered / total: `10 / 10`

## Evidence pointers

- `candidate/provenance-summary.json`
- `candidate/predictions.jsonl`
- `candidate/predictions_eval_summary.json`
- `candidate/execution-log.md`
- `candidate/execution-rerun.log`
- `candidate/logs/candidate-eval-rerun-20260222-043639.log`

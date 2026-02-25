# Baseline Artifact Manifest

- run_id: `run-20260221-212859-est`
- lane: `baseline`
- generated_at_utc: `2026-02-22T09:45:00Z`
- status: `complete_with_blocked_authority_command`

## Provenance/Citation Checklist

- [x] `predictions.jsonl` present (`10` records)
- [x] `predictions_eval_summary.json` present (`answered_samples=10`, `failed_samples=0`)
- [x] `provenance-summary.json` present with required keys: `coverage_rate`, `missing_citation_rate`, `invalid_citation_rate`, `notes`
- [x] `execution-log.md` records blocked authority command (`ModuleNotFoundError: arag.eval`) and artifact-derived outcomes

## Reconciled values (fresh outputs)

- citation coverage rate: `0.7`
- missing citation rate: `0.3`
- invalid citation rate: `0.1`
- answered / total: `10 / 10`

## Evidence pointers

- `baseline/provenance-summary.json`
- `baseline/predictions.jsonl`
- `baseline/predictions_eval_summary.json`
- `baseline/execution-log.md`
- `baseline/execution-rerun.log`

# Blockers — run-20260221-212859-est

## Candidate lane blocker status
- Prior runtime blocker (`invalid model ID`) is no longer governing the run.
- Fresh evidence source: `candidate/backups/predictions_eval_summary.json.20260222-052816.bak` (10 answered, 0 failed).

## Remaining gate blockers (policy adjudication)
- **No evidence-completeness blockers remain.**
- Authoritative dual-lane per-query latency telemetry is now present:
  - `comparison/gate/latency-rerun/baseline-workers1/predictions.jsonl`
  - `comparison/gate/latency-rerun/candidate-workers1/predictions.jsonl`
  - `comparison/gate/latency-rerun/per-query-latency-telemetry.json`
- Promotion is blocked on outcome regressions (not missing evidence):
  - Quality: candidate trails baseline (llm 0.60 vs 0.70; contain 0.80 vs 0.90)
  - Latency: candidate p50/p95 slower (+1,516 ms / +11,201 ms) on the measured slice.

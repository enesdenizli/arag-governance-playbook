# Latency Blocker Proof (Interim) — run-20260221-212859-est

## Claim
Authoritative baseline and candidate latency quantiles (p50/p95 end-to-end per query) are **not derivable from current run-local artifacts**.

## Hard evidence
1. Lane latency artifacts explicitly contain null quantiles:
   - `baseline/latency-cost.json`: `p50_latency_ms: null`, `p95_latency_ms: null`, status `measured_cost_only_latency_not_emitted_by_runner`
   - `candidate/latency-cost.json`: same null fields/status.

2. Comparison artifact already records latency as unavailable:
   - `comparison/cost-latency-envelope.json`:
     - `artifact_status: partial_latency_unavailable`
     - `latency_regression_determinable: false`
     - reason: runner does not emit per-query latency distribution.

3. Baseline rerun log has no timing series to reconstruct quantiles:
   - `baseline/execution-rerun.log` contains setup lines and output path only (no per-item timestamps, no progress timing, no per-query elapsed fields).

4. Prediction artifacts do not contain per-question timing keys:
   - `baseline/predictions.jsonl` and `candidate/predictions.jsonl` records include cost/tokens/loops, but no latency/time fields.

## Controlled instrumentation status
- Candidate controlled rerun (`comparison/gate/latency-rerun/candidate-workers1.log`) completed, but this alone cannot establish baseline-vs-candidate quantile evidence.
- Baseline controlled rerun with `--workers 1` was launched but not completed before this status check and was terminated on request for immediate interim output.

## Strict blocker conclusion
Until both lanes are rerun with deterministic latency instrumentation (or runner emits per-query elapsed_ms), baseline p50/p95 and candidate p50/p95 remain **UNKNOWN** for gate purposes.

## Minimal unblock requirement
Produce both:
- `comparison/gate/latency-rerun/baseline-workers1.log` and `.../candidate-workers1.log` with parseable per-query completion times (or JSON with per-query elapsed_ms), then compute quantiles from identical harness settings.

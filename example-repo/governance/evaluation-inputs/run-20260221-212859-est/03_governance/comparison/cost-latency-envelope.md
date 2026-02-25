# Cost/Latency Envelope Evidence — run-20260221-212859-est

## Scope
Authoritative workers=1 dual-lane reruns completed with direct per-query latency fields.

## Sources
- `comparison/gate/latency-rerun/baseline-workers1/predictions.jsonl`
- `comparison/gate/latency-rerun/candidate-workers1/predictions.jsonl`
- `comparison/gate/latency-rerun/per-query-latency-telemetry.json`

## Methodology
Latency uses emitted `latency_ms` per query from `predictions.jsonl` (no tqdm reconstruction).
Quantiles use nearest-rank (matching lane `latency_summary.json`).

## Observed Values
- Baseline: mean **43947.59 ms**, p50 **53681.77 ms**, p95 **66389.938 ms** (n=10)
- Candidate: mean **47445.181 ms**, p50 **55198.185 ms**, p95 **77591.256 ms** (n=10)

## Cost
- Baseline avg cost/query: **$0.008766**
- Candidate avg cost/query: **$0.007227**
- Candidate remains cheaper by **$0.001539/query** (~17.56%).

## Envelope Interpretation
- Cost envelope: **PASS** (candidate cheaper)
- Latency envelope: **FAIL** (candidate slower p50 and p95)
- Overall envelope: **FAIL** for promotion on this slice.

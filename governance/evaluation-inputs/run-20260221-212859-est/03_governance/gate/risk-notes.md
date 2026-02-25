# Risk Notes — run-20260221-212859-est

## Scope
Evidence-only risk posture using run-local artifacts.

## Key risks
1. **Latency observability risk (HIGH)**
   - Baseline `p50_latency_ms`/`p95_latency_ms` are null.
   - Candidate latency quantiles are proxy-derived from batch completion intervals.
   - Risk: latency envelope adjudication is not promotability-grade.

2. **Quality-regression adoption risk (MEDIUM)**
   - Candidate is worse on current n=10 quality slice (`llm_accuracy 0.60 < 0.70`, `contain_accuracy 0.80 < 0.90`).
   - Risk: adopting candidate would reduce answer quality.

3. **Harness-path parity audit risk (MEDIUM)**
   - Authority command path remains non-importable (`arag.eval.step1`), while outcomes are reconciled from successful rerun artifacts.
   - Risk: audit friction if strict command-parity evidence is required.

## Mitigations currently in effect
- Final gate remains `HOLD`.
- Baseline retained (`gpt-5-mini-control`).
- Provenance/citation summaries and traceability fields are present and deterministic.

## Rollback trigger(s)
- If any non-HOLD decision is proposed before authoritative latency telemetry and quality parity/uplift, force baseline-only posture.

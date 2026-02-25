# Execution Lane README (B/C Prereqs + Normalized Artifact Schema)

Shared boundary/purpose rules live in `README.md`.
This file defines **execution-lane-specific** contract details only.

## 1) Run Directory Layout (Required)

Each evaluation run MUST use:

`governance/evaluation-inputs/<run-id>/`

Required layout:

```text
governance/evaluation-inputs/<run-id>/
  run-manifest.json
  dataset-manifest.json
  comparison/
    summary.md
    decision-input.json
  baseline/
    profile.json
    metrics.json
    guardrail-compliance.json
    latency-cost.json
    provenance-summary.json
  candidate/
    profile.json
    metrics.json
    guardrail-compliance.json
    latency-cost.json
    provenance-summary.json
```

Optional (recommended):

```text
  baseline/retrieval-observations.ndjson
  candidate/retrieval-observations.ndjson
  checksums.sha256
```

## 2) Lane B Prerequisites (Execution Readiness)
1. Profile declaration complete.
2. Retrieval observation schema compatibility confirmed (`schemas/json/retrieval-observation.v1.json`).
3. Policy guardrails active.
4. Protocol parity guaranteed.
5. Runbook alignment (`runbooks/runbook-rag-eval-gate.md`).

If unmet, mark run blocked; do not publish decision-ready comparison.

## 3) Lane C Prerequisites (Adjudication Readiness)
1. Complete baseline/candidate required files.
2. Normalized metric comparison includes required metrics.
3. Explicit pass/fail + regression flags.
4. `comparison/decision-input.json` outcome in:
   `accept_candidate | keep_baseline | unknown_escalation`.
5. Human-readable `comparison/summary.md` rationale.

If evidence is inconclusive/conflicting, outcome MUST be `unknown_escalation`.

## 4) Normalized File Contract (Minimal Keys)
- `run-manifest.json`: `run_id, created_at, trigger, baseline_profile_id, candidate_profile_id, status`
- `dataset-manifest.json`: `dataset_id, split_id, sample_count, frozen_at, notes`
- `<variant>/profile.json`: `profile_id, model, embedding_profile, retrieval_config, rerank_config, build_or_commit`
- `<variant>/metrics.json`: `precision_at_k, citation_coverage, grounded_answer_rate, stale_context_rate, contradiction_rate`
- `<variant>/guardrail-compliance.json`: `hybrid_retrieval_compliant, citation_provenance_compliant, stale_context_demotion_compliant, policy_violations`
- `<variant>/latency-cost.json`: `p50_latency_ms, p95_latency_ms, avg_cost_per_query, envelope_compliant`
- `<variant>/provenance-summary.json`: `coverage_rate, missing_citation_rate, invalid_citation_rate, notes`
- `comparison/decision-input.json`: `run_id, baseline_profile_id, candidate_profile_id, metric_deltas, guardrail_regressions, latency_cost_regressions, recommended_outcome`
- `comparison/summary.md`: what tested, key deltas, compliance/risk notes, recommendation.

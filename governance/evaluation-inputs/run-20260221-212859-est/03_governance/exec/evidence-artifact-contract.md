# Evidence Artifact Contract (Normalized) — run-20260221-212859-est

Purpose: define the required baseline/candidate evidence artifacts and JSON object shapes for adjudication-ready execution evidence in this run.

Authority: `governance/evaluation-inputs/README-exec-lane.md` (normalized execution-lane contract).

## 1) Required Files (Exact)

### Run root (required)
- `run-manifest.json`
- `dataset-manifest.json`

### Comparison (required)
- `comparison/summary.md`
- `comparison/decision-input.json`

### Baseline lane (required)
- `baseline/profile.json`
- `baseline/metrics.json`
- `baseline/guardrail-compliance.json`
- `baseline/latency-cost.json`
- `baseline/provenance-summary.json`

### Candidate lane (required)
- `candidate/profile.json`
- `candidate/metrics.json`
- `candidate/guardrail-compliance.json`
- `candidate/latency-cost.json`
- `candidate/provenance-summary.json`

### Optional (traceability-only)
- `baseline/retrieval-observations.ndjson`
- `candidate/retrieval-observations.ndjson`
- `checksums.sha256`

---

## 2) JSON Shape Contract (Required Keys)

Notes:
- Shapes below define required keys/types only.
- Additional keys are allowed if they do not conflict with policy.
- This document does **not** provide metric values.

### 2.1 `run-manifest.json`
```json
{
  "run_id": "string",
  "created_at": "ISO-8601 datetime string",
  "trigger": "string",
  "baseline_profile_id": "string",
  "candidate_profile_id": "string",
  "status": "in_progress | complete | blocked"
}
```

### 2.2 `dataset-manifest.json`
```json
{
  "dataset_id": "string",
  "split_id": "string",
  "sample_count": "number",
  "frozen_at": "ISO-8601 datetime string",
  "notes": "string"
}
```

### 2.3 `<lane>/profile.json` (`baseline` and `candidate`)
```json
{
  "profile_id": "string",
  "model": "string",
  "embedding_profile": "string",
  "retrieval_config": "object",
  "rerank_config": "object",
  "build_or_commit": "string"
}
```

### 2.4 `<lane>/metrics.json`
```json
{
  "precision_at_k": "number",
  "citation_coverage": "number",
  "grounded_answer_rate": "number",
  "stale_context_rate": "number",
  "contradiction_rate": "number"
}
```

### 2.5 `<lane>/guardrail-compliance.json`
```json
{
  "hybrid_retrieval_compliant": "boolean",
  "citation_provenance_compliant": "boolean",
  "stale_context_demotion_compliant": "boolean",
  "policy_violations": ["string"]
}
```

### 2.6 `<lane>/latency-cost.json`
```json
{
  "p50_latency_ms": "number",
  "p95_latency_ms": "number",
  "avg_cost_per_query": "number",
  "envelope_compliant": "boolean"
}
```

### 2.7 `<lane>/provenance-summary.json`
```json
{
  "coverage_rate": "number",
  "missing_citation_rate": "number",
  "invalid_citation_rate": "number",
  "notes": "string"
}
```

### 2.8 `comparison/decision-input.json`
```json
{
  "run_id": "string",
  "baseline_profile_id": "string",
  "candidate_profile_id": "string",
  "metric_deltas": "object",
  "guardrail_regressions": "array",
  "latency_cost_regressions": "array",
  "recommended_outcome": "accept_candidate | keep_baseline | unknown_escalation"
}
```

---

## 3) Contract Validity Rule

A lane is contract-complete only when **all five required lane files exist** and each contains the required keys with correct primitive types.

- Missing file => contract failure.
- Missing required key => contract failure.
- Invalid enum value => contract failure.
- Placeholder-only or unknown-value decision records are not adjudication-ready.

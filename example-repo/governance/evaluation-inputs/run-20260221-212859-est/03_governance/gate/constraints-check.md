# Constraints Check — run-20260221-212859-est

- Checked At (UTC): `2026-02-22T09:47:30Z`
- Gate status: **HOLD**

## Contract Compliance
- Schema validation complete: **PASS** (required comparison + gate artifacts present and populated)
- Required fixtures pass: **PASS** (no fixture/syntax blockers in refreshed package)

## Governance Constraints
- Compatibility policy reviewed: **PASS**
- Deprecation policy impact reviewed: **PASS**
- Tooling profile compliance reviewed: **PASS**

## Blockers

- Checklist-completeness artifacts are present (`gate/provenance-citation-summary.json`, `comparison/cost-latency-envelope.md`, `gate/risk-notes.md`).
- Traceability fields are populated deterministically from `run-manifest.json#source_pin.source_commit`.
- Provenance/citation summaries are reconciled with successful rerun evidence; authority-command import failures remain documented for auditability.
- Promotion remains non-admissible on latency evidence quality:
  - baseline lane has no emitted p50/p95 latency quantiles
  - candidate lane p50/p95 are proxy values derived from batch progress completion intervals, not authoritative per-query E2E telemetry.

- Delta vs prior gate pass: candidate invalid-model blocker is cleared; HOLD basis is now latency admissibility quality.

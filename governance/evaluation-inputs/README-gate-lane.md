# Gate Lane Checklist Template (A-RAG Evaluation)

Shared purpose/boundary rules live in `README.md`.
This file defines gate-lane adjudication checks and outputs.

## 1) Expected Run Layout
For each run:
- `governance/evaluation-inputs/<run-id>/manifest.json`

Recommended packs by stream:
- D (Metrics/Comparison): `comparison/metrics-table.md`, `comparison/metrics-summary.json`, `comparison/dataset-parity.md`
- E (Guardrail/Compliance): `gate/guardrail-compliance.md`, `gate/provenance-citation-summary.json`, `gate/constraints-check.md`, `gate/constraints-check.json`
- F (Risk/Envelope/Escalation): `comparison/cost-latency-envelope.md`, `gate/risk-notes.md`, `gate/unknown-escalation.json` (UNKNOWN only)

If filenames differ, map them in `manifest.json.evidence_index`.

## 2) Required Evidence Checklist (Gate Input)
Mark each `present|missing|invalid`:
- `manifest.json` with traceability
- Baseline vs candidate metric comparison (D)
- Dataset/split parity statement (D)
- Provenance/citation compliance summary (E)
- Governance constraints check (E)
- Cost/latency envelope summary (F)
- Risk notes with rollback trigger(s) (F)
- UNKNOWN escalation payload (only if decision=UNKNOWN)

Minimum trace fields:
- `trace_id`
- `parent_trace_id`
- `status` in `{IN_PROGRESS,BLOCKED,READY_FOR_REVIEW,UNKNOWN,DONE}`

## 3) Gate Decision Criteria
- **PROCEED**: all required evidence valid; no guardrail/constraint failures; no unmitigated high risk.
- **HOLD**: evidence mostly sufficient but not review-ready; remediable gaps.
- **FAIL**: hard gate violation (guardrail/constraint/envelope/critical risk).
- **UNKNOWN**: conflicting/inconclusive evidence or broken traceability beyond SLA.

## 4) Parent-Gate Adjudication Output
Suggested path: `.../gate/final-gate-decision.md`

Fields:
- `run_id`
- `decision` (`PROCEED|HOLD|FAIL|UNKNOWN`)
- `selected_profile` (if PROCEED)
- `evidence_files_reviewed`
- `key_findings`
- `blockers_or_risks`
- `rollback_trigger`
- `escalation_reference` (if UNKNOWN)
- `timestamp_utc`

This summary feeds:
- `governance/decision-report-arag-model-selection-v1.md`

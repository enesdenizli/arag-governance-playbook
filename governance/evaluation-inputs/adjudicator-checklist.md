# Adjudicator Checklist (Parent-Gate Input Mapping)

Purpose: deterministic adjudication across evidence lanes D/E/F with explicit outcome mapping and minimal reporting diffs.

## 1) Required Evidence Inputs and Outcome Mapping

Mark each input as `present|missing|invalid|pending`.

| Evidence input | Required for decision | PROCEED impact | HOLD impact | FAIL impact | UNKNOWN impact |
|---|---|---|---|---|---|
| `manifest.json` with traceability fields (`trace_id`, `parent_trace_id`, `status`) | Yes | Must be present/valid | Missing/format gaps can HOLD if recoverable quickly | Invalid traceability that breaks determinism can FAIL if non-repairable in-window | Conflicting or broken trace chain -> UNKNOWN if reliability cannot be restored |
| D: `comparison/metrics-table.md` + `comparison/metrics-summary.json` | Yes | Candidate acceptable vs baseline | Missing or stale metrics artifact(s) | Confirmed regressive or disqualifying metrics | Conflicting metrics sources |
| D: `comparison/dataset-parity.md` | Yes | Split parity confirmed | Pending clarification of parity method | Proven non-parity / invalid comparison basis | Parity status cannot be established |
| E: `gate/provenance-citation-summary.json` | Yes | Compliance pass | Missing summary but expected imminently | Compliance fail (citation/provenance breach) | Inconclusive compliance evidence |
| E: `gate/constraints-check.md` + `gate/constraints-check.json` | Yes | Deterministic pass | Pending reviewer sign-off on non-fatal checks | Contract/governance constraints fail | Contradictory check states or unresolved blockers beyond SLA |
| F: `comparison/cost-latency-envelope.md` | Yes | Within approved envelope | Missing envelope summary pending generation | Envelope breach without approved exception | Envelope evidence contradictory/incomplete |
| F: `gate/risk-notes.md` incl. rollback trigger(s) | Yes | Risks mitigated and rollback triggers defined | Risks documented but mitigation details pending | Critical unmitigated risk | Risk posture cannot be confidently bounded |
| `gate/unknown-escalation.json` | Conditionally required (only for UNKNOWN) | Not required | Not required | Not required | Required; must include `unknown_reason`, open questions, escalation target |

## 2) Deterministic Decision Rules

1. **PROCEED**
   - All required non-conditional artifacts are `present` and `valid`.
   - No guardrail/constraint failures.
   - No unmitigated high-severity risk.
   - Candidate fits approved cost/latency envelope.

2. **HOLD**
   - One or more required artifacts are `missing|pending`, but gap is remediable without full re-run.
   - No confirmed hard-gate violation yet.

3. **FAIL**
   - Any hard violation is confirmed:
     - Guardrail non-compliance,
     - Constraint/contract failure,
     - Envelope breach without exception,
     - Critical unmitigated risk.

4. **UNKNOWN**
   - Evidence is conflicting/inconclusive or traceability is unreliable.
   - `unknown-escalation.json` is created and referenced.

## 3) Minimal Diff Plan (Decision Report + Changelog)

Target file: `governance/decision-report-arag-model-selection-v1.md`

Apply only these minimal edits for the current run:
1. Fill **Decision Statement** placeholders:
   - `Selected model/profile`
   - `Scope of adoption`
   - `Effective governance version`
2. Fill **Evidence Summary** from run artifacts:
   - baseline/candidate IDs
   - metric summary lines
   - confidence assessment
3. Fill **Guardrail Check** pass/fail values from Lane E evidence.
4. Fill **Risk Assessment** and rollback trigger conditions from Lane F evidence.
5. Fill **Adoption Directive** (approved ID or UNKNOWN + rollout conditions).
6. If decision is UNKNOWN, populate the **UNKNOWN Escalation** section.
7. In **Decision Inputs (Isolated)**, append explicit run reference:
   - `governance/evaluation-inputs/run-20260221-212859-est/`
8. Append a single line to **Change Log** section in this file:
   - `- v1.x: adjudication updated for run-20260221-212859-est (decision=<PROCEED|HOLD|FAIL|UNKNOWN>)`

Target file: `governance/changelog.md`

Add one top-entry section (next semantic increment) with minimal bullets:
- Added adjudicator checklist:
  - `governance/evaluation-inputs/adjudicator-checklist.md`
- Added final gate decision stub for run:
  - `governance/evaluation-inputs/run-20260221-212859-est/gate/final-gate-decision.md`
- Updated decision report with run adjudication outcome (when applied).

## 4) Run-Specific Status Snapshot (run-20260221-212859-est)

Current observable status at checklist creation:
- `manifest.json`: present (traceability fields incomplete for adjudication standard)
- `constraints-check.*`: present, status pending
- D/E/F decision evidence set: incomplete
- Provisional gate posture: `HOLD` until evidence completion

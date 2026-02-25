# Adjudication Thresholds — run-20260221-212859-est

Purpose: define explicit pass/fail/hold/unknown criteria for final gate adjudication using only run-local evidence.

## 0) Evidence admissibility threshold (hard prerequisite)

Adjudication is **not allowed** unless all required evidence files exist and are internally consistent.

Minimum required set (from current run artifacts and checklist expectations):
- `manifest.json`
- `comparison/decision-input.json`
- `comparison/verdict.json`
- `comparison/evidence-summary.md`
- `gate/constraints-check.json`
- `gate/policy-isolation-check.json`
- `gate/security-gate.json`
- Plus checklist-marked artifacts currently missing in `comparison/verdict.json`:
  - provenance/citation summary
  - cost/latency envelope
  - risk notes

### Threshold
- If any required artifact is missing/unreadable -> **HOLD**
- If artifacts exist but contain unresolved conflict/untraceable provenance -> **UNKNOWN**

---

## 1) Security lane thresholds (from `gate/security-gate.json` semantics)

### 1.1 PASS for security lane
All must be true:
1. Secure-continue chain complete (`escalate`, `remediate`, `resume` not `pending`).
2. All critical finding checks resolved to `pass` (or explicitly not applicable with evidence).
3. No unresolved critical finding in `critical_findings_summary`.
4. Output decision in `security-gate.json` is single and policy-valid (`proceed=true` only).

### 1.2 FAIL for security lane
Any one is sufficient:
1. Confirmed unresolved hard violation (e.g., active secret exposure, confirmed exploitation path, unpatched critical/high in active path, integrity compromise).
2. Remediation evidence invalid/non-reproducible for a claimed fix.
3. Resume decision policy-blocked.

### 1.3 HOLD for security lane
- Evidence is incomplete but no confirmed hard-fail condition yet.

### 1.4 UNKNOWN for security lane
- Conflicting findings, broken traceability, or unresolved escalation beyond SLA with no reliable determination.

---

## 2) Policy lane thresholds

### 2.1 PASS for policy lane
All must be true:
1. `gate/policy-isolation-check.json` checks resolved with no violations.
2. `gate/constraints-check.json` checks resolved with gate status indicating ready.
3. Traceability fields are populated and consistent (`trace_id`, `parent_trace_id`, status/profile IDs not `UNKNOWN`).
4. Verdict checklist-required inputs are all `present`.

### 2.2 FAIL for policy lane
Any one is sufficient:
1. Isolation violation on protected paths (`specs/**`, `schemas/**`, `runbooks/**`, governance core outside run-local scope).
2. Contract/schema/fixture noncompliance that blocks policy acceptance.
3. Provenance or policy evidence shows disallowed behavior without approved exception.

### 2.3 HOLD for policy lane
- Missing artifacts or pending checks, without confirmed hard violation.

### 2.4 UNKNOWN for policy lane
- Conflicting policy evidence or untraceable mapping across artifacts.

---

## 3) Final adjudication function

Let `S` = security lane result, `P` = policy lane result.

Decision precedence:
1. If `S=FAIL` or `P=FAIL` -> **FAIL**
2. Else if `S=UNKNOWN` or `P=UNKNOWN` -> **UNKNOWN** (must include escalation payload)
3. Else if `S=HOLD` or `P=HOLD` -> **HOLD**
4. Else if `S=PASS` and `P=PASS` -> **PROCEED**
5. Else -> **UNKNOWN** (defensive default)

---

## 4) Run-specific current status (file-backed)

Based on present files:
- `security-gate.json` = template state (`pending`/`unknown`) -> security lane currently **HOLD**
- `policy-isolation-check.json` = `pending` -> policy lane currently **HOLD**
- `constraints-check.json` = `pending` -> policy lane still **HOLD**
- `decision-input.json` and `verdict.json` contain `UNKNOWN` placeholders and missing checklist entries -> adjudication prerequisites unmet

### Current adjudication outcome
- **HOLD**

### Exact transition threshold out of HOLD
- All required evidence present, all pending/unknown resolved, and lane outcomes computable by the function above.

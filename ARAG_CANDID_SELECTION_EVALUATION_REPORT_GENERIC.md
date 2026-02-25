# ARAG Candidate Selection Evaluation Report (Sanitized Template)

This is a **sanitized companion** to the canonical run report:
- `ARAG_CANDID_SELECTION_EVALUATION_REPORT.md`

Use this file only when sharing externally without run-identifying details.

## Canonical decision (mirrors source report)
- Decision: `HOLD`
- Selected profile: `gpt-5-mini-control` (baseline retained)
- Frozen gate: `frozen_pass_criteria_gate=FAIL` / `frozen_selection=SELECT_BASELINE`
- Reason: candidate improved cost, but regressed on quality and latency under frozen non-regression criteria.

## Redaction rules
When generating a sanitized share:
1. Replace run IDs/timestamps with neutral placeholders.
2. Keep metrics and decision logic unchanged.
3. Cite run-scoped evidence path generically as `governance/evaluation-inputs/<run-id>/`.
4. Do not add claims not present in the canonical report.

## Short share text
A-RAG model selection result: baseline retained.
Candidate cost was lower, but quality and latency regressed under frozen non-regression gates, so outcome is HOLD.

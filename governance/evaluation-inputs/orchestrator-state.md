# Orchestrator State Template

Use this file only as a transient status board during an active run.

## Template fields
- Run ID:
- State: `IN_PROGRESS | BLOCKED | READY_FOR_REVIEW | UNKNOWN | DONE`
- Last updated (UTC):
- Current blocker(s):
- Next action:
- Owner:

## Guidance
- Prefer run-scoped status files under `governance/evaluation-inputs/<run-id>/`.
- Do not treat this root file as source of truth for finalized runs.

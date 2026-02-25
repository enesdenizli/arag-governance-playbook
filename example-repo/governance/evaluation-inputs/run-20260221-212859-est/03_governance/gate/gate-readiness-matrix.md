# Gate Readiness Matrix — run-20260221-212859-est

## Current readiness decision

- **Readiness:** NOT READY for PROCEED/FAIL
- **Current gate decision:** **HOLD**

## Evidence snapshot

### Present
- `manifest.json`, `run-manifest.json`, dataset manifest
- Baseline lane normalized outputs: `profile.json`, `metrics.json`, `guardrail-compliance.json`, `latency-cost.json`, `provenance-summary.json`
- Candidate lane normalized outputs: `profile.json`, `metrics.json`, `guardrail-compliance.json`, `latency-cost.json`, `provenance-summary.json`
- Lane execution logs and blockers for both lanes
- Comparison package: `decision-input.json`, `verdict.json`, `comparison-summary.md`, `table.md`, `evidence-summary.md`, `summary.md`, `blockers.md`
- Gate package: `security-gate.{json,md}`, `policy-isolation-check.{json,md}`, `constraints-check.{json,md}`, `adjudication-input-completeness.md`, `final-gate-decision.md`

### Blocking quality gaps
- Both lanes blocked before executable runtime evidence generation.
- Numeric metric/latency outputs are blocked-run placeholders.
- Guardrail compliance remains blocked-execution derived, not promotability-grade evidence.
- `trace_id` and `parent_trace_id` are populated via deterministic mapping from `run-manifest.json` source commit.
- Security evidence chain and secret-scan evidence unresolved.

## Lane controls

| Lane | Control | Current state | Gate impact | Unblock condition |
|---|---|---|---|---|
| Security | Escalate/remediate/resume evidence chain | incomplete | HOLD | Provide chain artifacts or policy-valid explicit N/A proof |
| Security | Critical finding checks | unresolved (`unknown`) | HOLD | Resolve checks to pass/fail with evidence |
| Policy | Isolation policy | pass | neutral | keep pass |
| Policy | Traceability completeness | pass (deterministic mapping populated) | neutral | keep mapping formula + provenance stable |
| Policy | Constraints check | hold | HOLD | Re-check after executable run evidence exists |
| Comparison | Verdict completeness | structurally complete, execution-blocked | HOLD | produce real runtime evidence |

## Required package to move off HOLD

1. Restore runnable eval harness for baseline and candidate commands.
2. Re-execute both lanes with pinned dataset/split/seed/limit.
3. Regenerate normalized artifacts from measured runtime outputs.
4. Keep traceability mapping stable and refresh policy/security/constraints checks after new executable evidence is generated.

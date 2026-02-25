# Decision Report Patch Plan — run-20260221-212859-est

Purpose: map run-local adjudication artifacts to exact sections in `governance/decision-report-arag-model-selection-v1.md` so the report can be patched immediately once missing command/evidence artifacts are produced.

## Isolation rule
Only consume artifacts under:
- `governance/evaluation-inputs/run-20260221-212859-est/**`

Do **not** source values from non-run governance/spec files except section labels and adjudication rules.

## Section-by-section mapping

| Decision report section | Required run-local artifact(s) | Patch instruction |
|---|---|---|
| `## Decision Statement` | `gate/final-gate-decision.md`, `comparison/verdict.json` | Set selected model/profile and adoption scope from final gate decision (`PROCEED/HOLD/FAIL/UNKNOWN`) and selected profile. |
| `## Evidence Summary` | `comparison/decision-input.json`, `comparison/table.md`, baseline/candidate `metrics.json` + `profile.json` (when present) | Fill baseline/candidate IDs, metric deltas, and confidence. If unresolved fields remain, keep `UNKNOWN` and block finalization. |
| `## Guardrail Check` | baseline/candidate `guardrail-compliance.json`, `comparison/decision-input.json` | Patch each guardrail line (`hybrid`, `rerank/pack`, `citation/provenance`, `stale-context demotion`) to pass/fail with evidence-backed values. |
| `## Risk Assessment` | baseline/candidate `latency-cost.json`, `comparison/verdict.json`, run-local risk notes artifact (once produced) | Populate regression/failure-mode text and rollback trigger verbatim from run evidence. |
| `## Adoption Directive` | `gate/final-gate-decision.md`, `comparison/verdict.json` | Set approved profile ID, rollout conditions, and validation window aligned with final gate decision. |
| `## UNKNOWN Escalation (if applicable)` | `gate/unknown-escalation.json`, `comparison/verdict.json`, `gate/final-gate-decision.md` | Populate only when final decision is `UNKNOWN`; otherwise mark N/A. |
| `## Decision Inputs (Isolated)` | Run-local artifact list from `gate/final-gate-decision.md` | Update references list to exact files reviewed. |
| `## Change Log` | Patch metadata from this run | Append entry describing field-level changes and evidence set used. |

## Required evidence deltas before report can be finalized

1. Baseline outputs exist: `profile.json`, `metrics.json`, `guardrail-compliance.json`, `latency-cost.json`, `provenance-summary.json`.
2. Candidate outputs exist: same five artifacts.
3. `comparison/verdict.json` checklist flips missing items to `present` for:
   - provenance/citation summary
   - cost/latency envelope
   - risk notes
4. Gate checks resolve from `pending/unknown` to adjudicable states in:
   - `gate/security-gate.json`
   - `gate/policy-isolation-check.json`
   - `gate/constraints-check.json`

## Patch sequence (apply in this order)

1. Recompute and patch `gate/adjudication-input-completeness.md`.
2. Recompute and patch `gate/final-gate-decision.md` using precedence (FAIL > UNKNOWN > HOLD > PROCEED).
3. Patch `governance/decision-report-arag-model-selection-v1.md` section-by-section from mapping above.
4. Append changelog entry to decision report with run ID, timestamp, changed fields, and evidence files.

## Current state snapshot

- Final gate decision is `HOLD`.
- Decision report patching is structurally mapped and ready.
- Final report population is blocked on missing baseline/candidate normalized evidence and unresolved gate checks.

# Final Next Actions — run-20260221-212859-est

## Priority Queue

### P0 (must happen first) — Authoritative command provenance
- Owner lane: exec-parent (command provenance specialist)
- Required outputs:
  - Exact baseline and candidate executable commands (not proposals)
  - Invocation context (npm script vs node entrypoint), deterministic args, dataset/split/seed pinning
  - Command-to-artifact mapping for required files in `baseline/`, `candidate/`, `comparison/`
- Exit criteria:
  - `baseline-command-needs-verification.md` and `candidate-command-needs-verification.md` no longer BLOCKED

### P1 — Baseline evidence generation
- Owner lane: baseline execution specialist
- Required outputs (minimum):
  - `baseline/profile.json`
  - `baseline/metrics.json`
  - `baseline/guardrail-compliance.json`
  - `baseline/latency-cost.json`
  - `baseline/provenance-summary.json`
- Exit criteria:
  - No placeholder/UNKNOWN-only baseline files

### P2 — Candidate evidence generation
- Owner lane: candidate execution specialist
- Required outputs (minimum):
  - `candidate/profile.json`
  - `candidate/metrics.json`
  - `candidate/guardrail-compliance.json`
  - `candidate/latency-cost.json`
  - `candidate/provenance-summary.json`
- Exit criteria:
  - No placeholder/UNKNOWN-only candidate files

### P3 — Manifest reconciliation and traceability completion
- Owner lane: manifest reconciliation specialist
- Required updates:
  - Populate concrete `trace_id`, `parent_trace_id`, `baseline_profile_id`, `candidate_profile_id`, dataset/split parity fields
  - Ensure run-local manifest/decision inputs reflect actual execution provenance
- Exit criteria:
  - `comparison/decision-input.json` and related gate inputs have no unresolved critical identifiers

### P4 — Comparison finalization
- Owner lane: compare specialist
- Required updates:
  - Replace UNKNOWNs in `comparison/table.md`, `comparison/evidence-summary.md`, `comparison/verdict.json`
  - Include guardrail regression determination and cost/latency envelope result
- Exit criteria:
  - Comparison package is evidence-backed and internally consistent

### P5 — Gate + adjudication finalization
- Owner lane: gate-parent / adjudication specialist
- Required outputs:
  - Update `gate/final-gate-decision.md` from stub HOLD to evidence-backed `PROCEED|HOLD|FAIL|UNKNOWN`
  - If `UNKNOWN`, include escalation payload path and populated artifact
  - Prepare decision report update consumption inputs
- Exit criteria:
  - Single final decision with referenced evidence set and rollback trigger

## Dependency / Unblock Order

`P0 -> (P1 || P2) -> P3 -> P4 -> P5`

- Parallelizable: P1 and P2 after P0
- Non-parallel hard gates: P3 before P4; P4 before P5

## Current recommendation

- **Do not execute final compare/gate/adjudication yet (NO-GO).**
- Proceed only after P0–P3 complete with authoritative, non-placeholder evidence.

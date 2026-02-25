# Wave 2 Dependency Graph — run-20260221-212859-est

## DAG (dependency-locked)

```text
A0 Authority
   └──> A1 Manifest reconciliation
            └──> A2 Baseline lane  ┐
            └──> A3 Candidate lane ├──> A4 Compare
                                     └──> A5 Gate/Report
```

## Node definitions and closure criteria

### A0 Authority
- Inputs: `exec/command-authority.json`, `exec/command-authority-report.md`
- Closure criteria:
  - `baseline_eval_cmd != UNKNOWN`
  - `candidate_eval_cmd != UNKNOWN`
  - command provenance is source-controlled and line-referenceable.
- Current: **BLOCKED (UNKNOWN)**

### A1 Manifest reconciliation
- Inputs: run manifest + concrete IDs from executed lanes
- Closure criteria: decision-critical IDs non-UNKNOWN (`baseline_profile_id`, `candidate_profile_id`, `trace_id`, `parent_trace_id`, dataset parity fields).
- Current: **NOT ELIGIBLE** (A0 not closed)

### A2 Baseline lane
- Required outputs:
  - `baseline/profile.json`
  - `baseline/metrics.json`
  - `baseline/guardrail-compliance.json`
  - `baseline/latency-cost.json`
  - `baseline/provenance-summary.json`
- Current: **NOT ELIGIBLE** (A0 not closed)

### A3 Candidate lane
- Required outputs:
  - `candidate/profile.json`
  - `candidate/metrics.json`
  - `candidate/guardrail-compliance.json`
  - `candidate/latency-cost.json`
  - `candidate/provenance-summary.json`
- Current: **NOT ELIGIBLE** (A0 not closed)

### A4 Compare
- Requires: A1 + A2 + A3 closed
- Minimum output: `comparison/summary.md` + completed `comparison/decision-input.json`
- Current: **NOT ELIGIBLE**

### A5 Gate/Report
- Requires: A4 closed
- Output: evidence-backed final decision (non-template)
- Current: **NOT ELIGIBLE**

## Active cut (where execution stops)
- Cut node: **A0 Authority**
- Reason: critical UNKNOWN in authoritative command contract.
- Enforcement: Halt all downstream nodes (A1–A5).

# Wave 2 State Board — run-20260221-212859-est

Timestamp (EST): 2026-02-22 00:06
Mode: dependency-locked orchestration

Legend: `DONE` `ACTIVE` `BLOCKED` `HALTED` `UNKNOWN`

## Stage sequence (hard order)
1. Authority
2. Manifest
3. Baseline/Candidate (parallel lanes)
4. Compare
5. Gate/Report

## Current stage status

### 1) Authority
- Status: **UNKNOWN / BLOCKED**
- Evidence:
  - `exec/command-authority.json` => `baseline_eval_cmd=UNKNOWN`, `candidate_eval_cmd=UNKNOWN`, `status=UNKNOWN`
  - `exec/command-authority-report.md` confirms no authoritative baseline/candidate eval command in repo authority surfaces.
- Result: **Stage failed to close**.

### 2) Manifest
- Status: **HALTED (dependency lock from Authority)**
- Note: `manifest.json` exists but downstream decision-critical IDs remain UNKNOWN in `comparison/decision-input.json`.

### 3) Baseline/Candidate (parallel)
- Status: **HALTED (not started due Authority UNKNOWN)**
- Evidence: required normalized JSON artifacts are missing for both lanes.

### 4) Compare
- Status: **HALTED (not eligible)**
- Evidence: `comparison/decision-input.json` remains UNKNOWN across critical fields; `comparison/summary.md` missing.

### 5) Gate/Report
- Status: **HALTED for finalization**
- Evidence: `gate/final-gate-decision.md` is currently `HOLD` and explicitly conditional on upstream evidence closure.

## Critical UNKNOWN (stop condition)
**UNKNOWN:** authoritative baseline and candidate executable eval commands.

**Exact unblock request:**
Commit source-controlled command authority for this run scope including:
1. exact `baseline_eval_cmd` and `candidate_eval_cmd` (entrypoint + full flags),
2. deterministic run args (run_id, output root, dataset_id/version/hash, split_id, seed if used),
3. command-to-artifact mapping proving production of required normalized outputs under:
   - `baseline/{profile,metrics,guardrail-compliance,latency-cost,provenance-summary}.json`
   - `candidate/{profile,metrics,guardrail-compliance,latency-cost,provenance-summary}.json`

Downstream stages remain halted until this UNKNOWN is resolved.

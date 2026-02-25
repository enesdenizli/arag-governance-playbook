# Orchestrator Execution Plan — run-20260221-212859-est

## Scope and constraints
- Scope: close missing eval command authority + missing normalized evidence artifacts for this run only.
- Write boundary: `governance/evaluation-inputs/run-20260221-212859-est/**` (orchestrator outputs in `.../orchestrator/`).
- Evidence-first: no fabricated values, no inferred command provenance.
- Policy isolation: keep eval internals in evaluation lane; only normalized decision inputs flow to gate/adjudication.

## Current state (file-backed)
- `baseline_eval_cmd`: **UNKNOWN (Needs verification)**
- `candidate_eval_cmd`: **UNKNOWN (Needs verification)**
- Normalized required artifacts from `README-exec-lane.md` are largely missing (baseline/candidate required JSON sets + normalized manifests + `comparison/summary.md`).
- Compare/gate files exist mostly as stubs with `UNKNOWN`/`pending` placeholders.

## Responsibility map (parent / child / leaf)

### Parent: Orchestrator (this lane)
- Own dependency ordering, completion criteria, and handoff packets.
- Track artifact-level closure and unresolved UNKNOWNs.
- Enforce policy isolation + evidence-first checks before any “complete” claim.

### Parent: Exec-Parent
- Own command authority closure and execution readiness contract.
- Must publish authoritative command provenance for both variants.

#### Child A1: Command Authority Specialist
- Source-lock exact executable commands for baseline/candidate from repo-controlled authority.
- Required proof: source file + line references + deterministic invocation args.
- Output target inputs: `exec/command-authority-report.md`, `exec/execution-ready-checklist.md`.

#### Child A2: Manifest/Data Pinning Specialist
- Produce normalized `run-manifest.json` + `dataset-manifest.json` with non-fabricated values.
- Bind run/profile/dataset/split fields to authoritative sources.

#### Child A3: Baseline Execution Leaf
- Run authoritative baseline command once unblocked.
- Produce required normalized artifacts:
  - `baseline/profile.json`
  - `baseline/metrics.json`
  - `baseline/guardrail-compliance.json`
  - `baseline/latency-cost.json`
  - `baseline/provenance-summary.json`

#### Child A4: Candidate Execution Leaf
- Run authoritative candidate command once unblocked.
- Produce required normalized artifacts:
  - `candidate/profile.json`
  - `candidate/metrics.json`
  - `candidate/guardrail-compliance.json`
  - `candidate/latency-cost.json`
  - `candidate/provenance-summary.json`

### Parent: Compare/Gate-Parent
- Finalize comparison + adjudication inputs only after exec evidence exists.

#### Child B1: Compare Leaf
- Compute metric deltas from baseline/candidate artifacts.
- Produce/complete:
  - `comparison/summary.md`
  - `comparison/decision-input.json` (replace critical UNKNOWN fields)
  - supporting compare artifacts (`table.md`, `evidence-summary.md`, `verdict.json`) with consistent traceability.

#### Child B2: Gate/Adjudication Leaf
- Update gate outcomes from HOLD/UNKNOWN templates to evidence-backed status.
- Ensure policy/security checks reference run-local evidence only.

## Dependency graph (strict)
1. **D0 — Command authority closure** (A1)  
2. **D1 — Manifest/data pinning closure** (A2)  
3. **D2 — Baseline + Candidate execution artifacts** (A3 + A4, parallel after D0/D1)  
4. **D3 — Comparison finalization** (B1)  
5. **D4 — Gate/adjudication finalization** (B2)

`D0 + D1 -> D2 -> D3 -> D4`

## Exit criteria by dependency
- D0 exit: baseline/candidate commands are authoritative and reproducible (not proposals).
- D1 exit: `run-manifest.json` and `dataset-manifest.json` exist and satisfy minimal contract keys.
- D2 exit: all 10 required baseline/candidate normalized artifacts exist with non-placeholder evidence.
- D3 exit: `comparison/summary.md` and `comparison/decision-input.json` complete and internally consistent.
- D4 exit: gate decision status is evidence-backed with no unresolved critical UNKNOWN.

## UNKNOWNs and unblock requests
1. **UNKNOWN:** authoritative baseline eval command.  
   - Reason: not defined in current repo command authority sources.
   - Exact unblock request: add exact baseline executable command (entrypoint + flags + required args) in source-controlled authority (`package.json` scripts and/or runbook), with line-referenced provenance.

2. **UNKNOWN:** authoritative candidate eval command.  
   - Reason: same as baseline.
   - Exact unblock request: add exact candidate executable command (entrypoint + flags + required args) in source-controlled authority, with line-referenced provenance.

3. **UNKNOWN:** canonical pinned dataset/split contract values for this run.  
   - Reason: `dataset-manifest.json` absent.
   - Exact unblock request: provide immutable dataset identifier/version/hash/path, split id, sample count, and freeze timestamp for run `run-20260221-212859-est`.

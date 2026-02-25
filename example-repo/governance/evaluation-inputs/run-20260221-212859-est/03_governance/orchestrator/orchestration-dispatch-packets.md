# Orchestration Dispatch Packets — run-20260221-212859-est

Use these packets exactly for parent handoff. Evidence-first and policy isolation are mandatory.

---

## Packet A — To Exec-Parent (command authority + manifests + execution evidence)

### Mission
Close missing command authority and produce missing normalized baseline/candidate evidence artifacts for run `run-20260221-212859-est`.

### Required inputs to produce
1. Authoritative `baseline_eval_cmd` and `candidate_eval_cmd` (not proposals), with source file + line provenance.
2. Deterministic invocation args (run_id, dataset/split pinning, output root; seed if used).
3. Normalized manifests:
   - `run-manifest.json`
   - `dataset-manifest.json`
4. Required baseline outputs:
   - `baseline/profile.json`
   - `baseline/metrics.json`
   - `baseline/guardrail-compliance.json`
   - `baseline/latency-cost.json`
   - `baseline/provenance-summary.json`
5. Required candidate outputs:
   - `candidate/profile.json`
   - `candidate/metrics.json`
   - `candidate/guardrail-compliance.json`
   - `candidate/latency-cost.json`
   - `candidate/provenance-summary.json`

### Non-negotiable rules
- Do not fabricate command provenance or metric values.
- If command authority is absent, mark `UNKNOWN` and file explicit unblock request.
- Keep all artifacts run-local under `governance/evaluation-inputs/run-20260221-212859-est/`.

### Acceptance criteria
- Both eval commands are authoritative and reproducible with line-referenced provenance.
- All manifest + baseline + candidate required files exist and are non-placeholder.
- Any unresolved item is `UNKNOWN` with reason + exact unblock request.

### Current known UNKNOWN/unblock
- UNKNOWN baseline/candidate command authority in current runbook/package scripts.
- UNKNOWN canonical dataset/split pinning values for this run.

---

## Packet B — To Compare/Gate-Parent (consume only normalized evidence)

### Mission
Finalize comparison + gate/adjudication only after Exec-Parent produces complete normalized evidence.

### Preconditions (must all be true)
- Required baseline/candidate normalized artifact sets complete.
- `run-manifest.json` + `dataset-manifest.json` present and contract-valid.
- Critical IDs (`trace_id`, `parent_trace_id`, profile ids) are non-UNKNOWN and consistent.

### Required outputs
1. Comparison finalization:
   - `comparison/summary.md`
   - `comparison/decision-input.json` (critical fields resolved)
   - consistency updates for `comparison/table.md`, `comparison/evidence-summary.md`, `comparison/verdict.json`
2. Gate/adjudication finalization:
   - update gate decision artifacts from template HOLD/UNKNOWN to evidence-backed state
   - maintain policy/security traceability and run-local references only

### Non-negotiable rules
- Evidence-first: no synthetic deltas, no guessed IDs.
- Policy isolation: do not import raw eval internals into non-eval policy/spec files.
- If evidence conflicts or is incomplete, keep `UNKNOWN` and attach exact escalation/unblock request.

### Acceptance criteria
- Comparison recommendation is traceable to baseline/candidate artifacts.
- Gate decision is computable from concrete evidence, not placeholders.
- Any remaining UNKNOWN includes reason and exact unblock request.

---

## Packet C — Return protocol to Orchestrator

For each packet completion, report:
1. `Completed`: list of files created/updated.
2. `Evidence`: source-backed proof for each completed item.
3. `Blocked`: remaining UNKNOWNs.
4. `Unblock request`: exact required authority/data to proceed.

Format requirement: concise, file-path specific, no implied provenance.

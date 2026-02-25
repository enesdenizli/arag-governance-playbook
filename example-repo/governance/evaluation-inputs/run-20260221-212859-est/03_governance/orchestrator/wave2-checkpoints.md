# Wave 2 Checkpoints — run-20260221-212859-est

## Checkpoint log (dependency-locked sequence)

### CP-01 Authority
- Target: close authoritative baseline/candidate command contract.
- Evidence reviewed:
  - `exec/command-authority.json`
  - `exec/command-authority-report.md`
- Outcome: **FAILED / UNKNOWN**
  - `baseline_eval_cmd=UNKNOWN`
  - `candidate_eval_cmd=UNKNOWN`
- Decision: **STOP** downstream progression.

### CP-02 Manifest
- Entry condition: CP-01 must be closed.
- Outcome: **SKIPPED (LOCKED)**
- Reason: authority unresolved.

### CP-03 Baseline/Candidate parallel lanes
- Entry condition: CP-01 and CP-02 closed.
- Outcome: **SKIPPED (LOCKED)**
- Reason: no authoritative executable commands; required normalized lane outputs absent.

### CP-04 Compare
- Entry condition: CP-03 closed.
- Outcome: **SKIPPED (LOCKED)**
- Reason: compare inputs not materialized; decision-critical fields remain UNKNOWN.

### CP-05 Gate/Report
- Entry condition: CP-04 closed.
- Outcome: **SKIPPED (LOCKED)**
- Reason: only HOLD-safe placeholder state is supportable.

---

## Critical UNKNOWN declaration

**UNKNOWN:** Authoritative baseline/candidate eval command contract is missing.

**Exact unblock request:**
Provide a committed in-repo authority artifact (runbook/spec/script/workflow) that explicitly defines:
1. `baseline_eval_cmd` exact executable command,
2. `candidate_eval_cmd` exact executable command,
3. required deterministic args: `run_id`, output root, immutable `dataset_id/version/hash`, `split_id`, and seed (if applicable),
4. command-to-artifact mapping to all required normalized outputs for both lanes.

Until this is provided, orchestration remains halted at CP-01 by dependency lock.

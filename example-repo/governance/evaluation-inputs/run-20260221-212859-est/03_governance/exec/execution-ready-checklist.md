# Execution-Ready Checklist (Strict Pass/Fail) — run-20260221-212859-est

Decision mode: **all required gates must pass**. Any failed gate => **NO-GO**.

## Gate 0 — Command Authority

- [ ] PASS / [x] FAIL: Baseline eval command is authoritative in repo (script/runbook/package surface).
- [ ] PASS / [x] FAIL: Candidate eval command is authoritative in repo (script/runbook/package surface).
- [ ] PASS / [x] FAIL: Commands pin dataset and split IDs and output root.
- [x] PASS / [ ] FAIL: Explicit human approval request template is present in `exec/command-authority.json`.

Current state: **FAIL** (commands remain `UNKNOWN`; awaiting committed authority contract).

---

## Gate 1 — Manifest Contract

Required files at run root:
- `run-manifest.json`
- `dataset-manifest.json`

Checks:
- [x] PASS / [ ] FAIL: `run-manifest.json` exists and has required keys + valid `status` enum.
- [x] PASS / [ ] FAIL: `dataset-manifest.json` exists and has required keys.

Current state: **PASS** (canonical manifests normalized with provenance links; unresolved values remain explicitly `UNKNOWN`).

---

## Gate 2 — Baseline Required Evidence Set

All files below are mandatory (exact names):
- `baseline/profile.json`
- `baseline/metrics.json`
- `baseline/guardrail-compliance.json`
- `baseline/latency-cost.json`
- `baseline/provenance-summary.json`

Checks:
- [ ] PASS / [x] FAIL: All 5 baseline files exist.
- [ ] PASS / [x] FAIL: All 5 baseline files include required keys/types.

Current state: **FAIL**.

---

## Gate 3 — Candidate Required Evidence Set

All files below are mandatory (exact names):
- `candidate/profile.json`
- `candidate/metrics.json`
- `candidate/guardrail-compliance.json`
- `candidate/latency-cost.json`
- `candidate/provenance-summary.json`

Checks:
- [ ] PASS / [x] FAIL: All 5 candidate files exist.
- [ ] PASS / [x] FAIL: All 5 candidate files include required keys/types.

Current state: **FAIL**.

---

## Gate 4 — Comparison Package

Required files:
- `comparison/summary.md`
- `comparison/decision-input.json`

Checks:
- [ ] PASS / [x] FAIL: `comparison/summary.md` exists.
- [ ] PASS / [ ] FAIL: `comparison/decision-input.json` exists.
- [ ] PASS / [x] FAIL: `comparison/decision-input.json` contains non-placeholder adjudication-ready values.
- [ ] PASS / [x] FAIL: `recommended_outcome` is one of `accept_candidate|keep_baseline|unknown_escalation` and evidence-backed.

Current state: **FAIL**.

---

## Gate 5 — Lane B Prerequisites

- [ ] PASS / [x] FAIL: Baseline/candidate profile IDs fixed.
- [ ] PASS / [x] FAIL: Retrieval schema compatibility confirmed.
- [ ] PASS / [x] FAIL: Guardrails active during execution.
- [ ] PASS / [x] FAIL: Protocol parity (same dataset/split/procedure).
- [ ] PASS / [x] FAIL: Runbook alignment complete and executable.

Current state: **FAIL**.

---

## Global Decision Rule

- **GO** only if Gates 0–5 are all PASS.
- **NO-GO** if any gate FAILS.

## Current Run Verdict

`run-20260221-212859-est`: **NO-GO (BLOCKED)**

Blocking reasons (non-exhaustive): unresolved command authority, unresolved pinned dataset/split/seed/profile values, and missing baseline/candidate required evidence files.

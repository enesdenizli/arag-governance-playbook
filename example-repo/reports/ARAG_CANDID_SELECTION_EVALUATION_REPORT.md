# ARAG Candidate Selection Evaluation Report

**Run ID:** `run-20260221-212859-est`  
**Decision:** `HOLD`  
**Selected Profile:** `gpt-5-mini-control` (baseline retained)  
**Frozen Gate Result:** `frozen_pass_criteria_gate=FAIL` / `frozen_selection=SELECT_BASELINE`  
**Decision Basis:** Run-scoped governance evidence only (artifact-grounded)

---

Canonical governance decision artifact: `governance/decision-report-arag-model-selection-v1.md`  
Sanitized share template: `ARAG_CANDID_SELECTION_EVALUATION_REPORT_GENERIC.md`

## Executive Summary

The candidate profile (`openai-codex/gpt-5.3-codex`) was evaluated against baseline (`gpt-5-mini-control`) under a frozen, run-scoped governance protocol.

Final outcome: **do not promote candidate in this run**.

Why:
- Candidate was **cheaper** on average cost,
- but candidate **regressed on quality** and **regressed on latency**,
- and frozen pass criteria for this run required non-regression on both quality and latency.

Result: **HOLD with baseline retained**.

---

## 1) Scope and Evaluation Boundary

This report is built from local governance artifacts for one run:
- `governance/evaluation-inputs/run-20260221-212859-est/`

Boundary conditions reflected in planning inputs:
- decision-lane and gate-lane evidence only,
- adjudication via checklist-defined deterministic outcomes,
- traceability via manifest + checksums + run-local decision inputs,
- no external sources and no policy relaxation for this run.

---

## 2) Evidence Admissibility and Completeness

Adjudication moved through an evidence-maturity sequence:
1. Earlier state: latency admissibility gaps existed (non-authoritative/null quantiles in interim proof state).
2. Later state: dual-lane per-query latency telemetry became complete and authoritative.
3. Blocker closeout confirmed transition from **missing-evidence HOLD** to **regression-based HOLD**.

This means the final HOLD is not due to incomplete evidence; it is due to measured non-regression failures.

---

## 3) Comparative Results (Baseline vs Candidate)

From run decision inputs and comparison artifacts (`n=10`, both lanes answered `10/10`):

### Quality
- **LLM accuracy:** baseline `0.70` vs candidate `0.60`
- **Contain accuracy:** baseline `0.90` vs candidate `0.80`

Interpretation: Candidate fails quality non-regression.

### Cost
- **Average cost/query:** baseline `$0.008766` vs candidate `$0.007227`
- Approximate change: candidate lower by `~17.55%`

Interpretation: Candidate wins efficiency on direct cost.

### Latency
Authoritative per-query telemetry shows:
- **Baseline p50/p95:** `53681.77 / 66389.938 ms`
- **Candidate p50/p95:** `55198.185 / 77591.256 ms`
- Deltas reported in envelope: p50 `+1516.415 ms`, p95 `+11201.318 ms`

Interpretation: Candidate fails latency non-regression at both p50 and p95.

---

## 4) Frozen Gate Logic and Final Determination

Run-scoped frozen protocol required all-pass on:
- quality non-regression,
- latency non-regression (p50/p95),
- runtime stability.

With complete evidence, candidate did not satisfy required non-regression criteria.

Final recorded disposition in gate artifacts:
- `decision=HOLD`
- `selected_profile=gpt-5-mini-control`
- `frozen_pass_criteria_gate=FAIL`
- `frozen_selection=SELECT_BASELINE`

---

## 5) Governance, Guardrails, and Control Quality

Repository governance evidence indicates strong control posture during this cycle:
- Contract-driven orchestration and schema-backed validation matured through changelog versions.
- Security-first continuation model remained explicit (escalate -> remediate -> resume).
- Evaluation internals were kept isolated from core policy defaults.
- Adjudication outcomes remained deterministic and evidence-bound.

Operationally, the process corrected real blockers (runtime/importability, command-entrypoint mismatch, telemetry admissibility) before final adjudication.

---

## 6) Risk and Rollback Posture

Current risk decision is conservative and controlled:
- Baseline remains active,
- no promotion under mixed signals,
- no exception path around frozen criteria,
- future reconsideration requires new run evidence that clears quality + latency non-regression gates.

This is aligned with auditability and reliability objectives.

---

## 7) Traceability and Reproducibility

Traceability chain is present in run-local governance materials via:
- run manifest,
- artifact manifest/checksums,
- machine-readable decision input and verdict,
- gate closeout and changelog entries.

The run-local fix log also records environment remediation and pinned source context used to restore executable reruns.

---

## 8) Final Recommendation

✅ **Keep baseline (`gpt-5-mini-control`) for now.**  
⛔ **Do not promote candidate (`openai-codex/gpt-5.3-codex`) in run `run-20260221-212859-est`.**

Reason, in one line: **candidate improved cost but regressed on both quality and latency under complete, admissible, frozen-criteria evaluation evidence.**

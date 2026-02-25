# Agentic Ecosystem — ARAG Model Selection Workflow

Minimal, publish-ready snapshot of an **artifact-driven model selection workflow**.

## What this repo shows
- A reproducible evaluation structure
- Frozen non-regression gate logic (quality + latency)
- Decision traceability from evidence to final selection

## Latest outcome (example run)
- **Decision:** HOLD
- **Selected profile:** `gpt-5-mini-control` (baseline retained)
- **Why:** Candidate lowered cost but regressed on quality and latency under frozen criteria

## Start here
1. `ARAG_CANDID_SELECTION_EVALUATION_REPORT_GENERIC.md` (community-safe summary)
2. `ARAG_CANDID_SELECTION_EVALUATION_REPORT.md` (canonical report)
3. `governance/evaluation-inputs/run-20260221-212859-est/` (organized run artifacts)

## Repository scope (intentionally minimal)
This repo omits local runtime-heavy and machine-specific folders (venvs, working dirs, node_modules, secrets).

## Who this is for
People interested in practical governance workflows for model selection:
- compare baseline vs candidate
- enforce deterministic gates
- keep final decisions auditable

## Quick structure
- `governance/evaluation-inputs/.../01_manifests`
- `governance/evaluation-inputs/.../02_runs`
- `governance/evaluation-inputs/.../03_governance`
- `governance/evaluation-inputs/.../99_archive`

# Evaluation Inputs (Isolated Decision Lane)

This directory is the **single source of truth** for model-selection decision evidence.

## Purpose
Store baseline/candidate comparison outputs strictly for governance adjudication.

## Boundary (hard)
- Allowed: metric tables, compliance summaries, latency/cost envelopes, risk notes.
- Not allowed: copying raw comparison internals into core operating specs.

## Canonical run location
- `governance/evaluation-inputs/<run-id>/`

For the active adjudicated run:
- `governance/evaluation-inputs/run-20260221-212859-est/`

## Lane docs (specialized; avoid duplicating shared rules)
- Execution lane details: `README-exec-lane.md`
- Gate/adjudication checklist: `README-gate-lane.md`

## Primary consumer
- `governance/decision-report-arag-model-selection-v1.md`

## Status note
`orchestrator-state.md` is an archived bootstrap snapshot and not the live status source for completed runs. Use each run’s own orchestrator/gate artifacts for current state.

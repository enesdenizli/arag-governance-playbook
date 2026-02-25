# Evaluation Inputs (Template)

This directory is the reusable scaffold for model-selection governance evidence.

## Purpose
Store baseline/candidate comparison outputs used for adjudication.

## Canonical run location pattern
- `governance/evaluation-inputs/<run-id>/`

## Boundary rules
- Allowed: metrics, latency/cost envelopes, compliance summaries, risk notes, manifests.
- Avoid: ad-hoc undocumented artifacts that cannot be traced or reproduced.

## Lane docs
- Execution lane details: `README-exec-lane.md`
- Gate/adjudication checklist: `README-gate-lane.md`

## Notes
- Keep this directory template-first in root.
- Place any concrete published example runs under `example-repo/`.

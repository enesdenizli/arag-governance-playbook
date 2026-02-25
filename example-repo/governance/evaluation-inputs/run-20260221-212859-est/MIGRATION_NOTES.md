# Migration Notes

## Scope
Restructured **evaluation artifacts only** for run `run-20260221-212859-est`.
Parent framework/source code was not modified.

## What changed

### 1) Grouped top-level manifests
Moved:
- `dataset-manifest.json` → `01_manifests/dataset-manifest.json`
- `manifest.json` → `01_manifests/manifest.json`
- `run-manifest.json` → `01_manifests/run-manifest.json`

### 2) Grouped run outputs
Moved into `02_runs/`:
- `baseline/`
- `candidate/`
- `baseline-smoke/` (currently empty placeholder)
- `candidate-smoke/` (currently empty placeholder)
- `debug-baseline/`
- `trace-wave/`

### 3) Grouped governance/evaluation decision artifacts
Moved into `03_governance/`:
- `comparison/`
- `gate/`
- `orchestrator/`
- `exec/`
- `shared/`

### 4) Archived obvious redundancy/noise (non-destructive)
Moved into `99_archive/`:
- `02_runs/baseline/backups/` → `99_archive/backups/baseline-backups/`
- `02_runs/candidate/backups/` → `99_archive/backups/candidate-backups/`
- `02_runs/candidate/logs/` → `99_archive/logs/candidate-logs/`

## Rationale
- Keep research-facing artifacts clear and reviewable.
- Preserve full provenance/history while removing clutter from active run folders.
- Keep naming stable and sortable (`01_`, `02_`, `03_`, `99_`).

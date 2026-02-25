# Manifest Contract Reconciliation — run-20260221-212859-est

## Decision
Use the **execution-lane normalized manifest structure** as canonical for this run:
- `run-manifest.json` (required)
- `dataset-manifest.json` (required)

and retain compatibility with gate-lane references to `manifest.json` by allowing an alias/mapping only if explicitly indexed.

## Why this structure

1. **Exec-lane contract is explicit and normative for artifact production**
   - `README-exec-lane.md` requires `run-manifest.json` and `dataset-manifest.json` and defines their minimal key sets.
2. **Gate-lane allows filename differences via mapping/index**
   - `README-gate-lane.md` references `manifest.json` and explicitly permits differing filenames when logical-to-actual mapping is declared in `evidence_index`.
3. **Reconciliation policy**
   - For artifact generation and validation, enforce exec-lane names.
   - For gate consumers that still expect `manifest.json`, provide a compatibility alias or an index map without changing normalized canonical files.

## Canonical manifest model (selected)

### A) `run-manifest.json` (canonical)
Required keys:
- `run_id`
- `created_at`
- `trigger`
- `baseline_profile_id`
- `candidate_profile_id`
- `status` in `in_progress|complete|blocked`

### B) `dataset-manifest.json` (canonical)
Required keys:
- `dataset_id`
- `split_id`
- `sample_count`
- `frozen_at`
- `notes`

## Compatibility bridge for gate-lane

If `manifest.json` is required by a downstream gate artifact reader, then one of these must be true:

1. `manifest.json` is a direct alias copy of `run-manifest.json` plus `evidence_index`, or
2. `manifest.json` contains `evidence_index` entries mapping logical names to canonical files:
   - `run_manifest -> run-manifest.json`
   - `dataset_manifest -> dataset-manifest.json`

No ambiguity: canonical source-of-truth remains the two exec-lane manifest files above.

## Current run delta (observed)

Current root contains `manifest.json` with non-canonical shape and status value `initialized`.

Required to reconcile:
1. Add `run-manifest.json` with canonical keys and valid status enum.
2. Add `dataset-manifest.json` with canonical keys.
3. Either:
   - replace/upgrade `manifest.json` to include `evidence_index`, or
   - deprecate `manifest.json` where not needed by consumers.

## Enforcement outcome for this run

Until steps above are completed, manifest contract status is:
- **NON-COMPLIANT (execution-lane)**
- **NOT ADJUDICATION-READY**

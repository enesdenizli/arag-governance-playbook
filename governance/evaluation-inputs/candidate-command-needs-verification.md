# Blocking Report: Candidate Evaluation Command Needs Verification

## Status
**BLOCKED** — candidate evaluation cannot be executed as decision-ready evidence because authoritative executable command provenance is missing from runbook/spec + repo script surface.

## Scope Reviewed
- `governance/evaluation-inputs/README-exec-lane.md`
- `runbooks/runbook-rag-eval-gate.md`
- `specs/rag/spec-evaluation-metrics-v1.md`
- `governance/evaluation-inputs/README-gate-lane.md`
- existing lane evidence scaffold under `governance/evaluation-inputs/run-20260221-212859-est/`
- existing script exposure (as previously documented in baseline blocker: only `npm run validate:contracts`)

## Missing Command Provenance Evidence
1. No runbook/spec artifact provides **exact candidate execution command(s)** (name, flags, entrypoint).
2. No repository-level script contract currently exposes candidate evaluation invocation.
3. No pinned command-to-artifact mapping exists that proves which invocation produces required Lane B/C files:
   - `candidate/profile.json`
   - `candidate/metrics.json`
   - `candidate/guardrail-compliance.json`
   - `candidate/latency-cost.json`
   - `candidate/provenance-summary.json`
   - `comparison/decision-input.json`
   - `comparison/summary.md`
4. No provenance metadata fields are defined linking command invocation to outputs (e.g., script version, commit SHA, dataset hash, split/seed).

## Candidate Command Patterns (Needs Confirmation)
These are naming/shape candidates only; not yet authoritative:

1. **Single gate orchestrator**
   - `npm run eval:rag:gate -- --run-id <run_id> --dataset-id <dataset_id> --split-id <split_id> --baseline-profile-id <baseline_id> --candidate-profile-id <candidate_id>`

2. **Split lane commands**
   - `npm run eval:rag:baseline -- --run-id <run_id> ...`
   - `npm run eval:rag:candidate -- --run-id <run_id> ...`
   - `npm run eval:rag:compare -- --run-id <run_id>`

3. **Direct node entrypoint**
   - `node scripts/rag-eval.mjs --profile candidate --run-id <run_id> --dataset-id <dataset_id> --split-id <split_id> --seed <seed> --out governance/evaluation-inputs/<run_id>/candidate`
   - `node scripts/rag-compare.mjs --run-id <run_id> --in governance/evaluation-inputs/<run_id> --out governance/evaluation-inputs/<run_id>/comparison`

## Required Confirmations (Blocking)
1. **Authoritative candidate command(s)** and exact invocation form (npm vs node vs external harness).
2. **Canonical dataset/split pinning** method, including immutable IDs/hashes and deterministic seed.
3. **Metric set and thresholds source of truth** (including `precision@k`, `citation_coverage`, `grounded_answer_rate`, `stale_context_rate`, `contradiction_rate`, and latency/cost envelope).
4. **Output schema contract** for candidate + comparison artifacts and required trace/provenance fields.
5. **Protocol parity enforcement mechanism** proving baseline and candidate use identical dataset/split/procedure.
6. **Guardrail enforcement evidence points** proving hybrid/rerank/citation/stale-context checks are active at execution time.

## Exact Inputs Needed to Run Once Unblocked
Provide these concrete values before execution:

- `run_id` (unique, lane-local)
- `baseline_profile_id`
- `candidate_profile_id`
- `dataset_id`
- `dataset_version_or_hash`
- `split_id`
- `sample_count` (or selection query that deterministically resolves sample set)
- `seed` (if sampling/shuffling applicable)
- `precision_k` value(s)
- `latency_cost_envelope_id` (or explicit limits)
- `threshold_profile_id` for pass/fail + regression logic
- `build_or_commit` for evaluator + retrieval stack
- `output_root` (`governance/evaluation-inputs/<run_id>/`)
- `trace_id` and `parent_trace_id`

### Required Output Paths After Run
- `governance/evaluation-inputs/<run_id>/run-manifest.json`
- `governance/evaluation-inputs/<run_id>/dataset-manifest.json`
- `governance/evaluation-inputs/<run_id>/candidate/profile.json`
- `governance/evaluation-inputs/<run_id>/candidate/metrics.json`
- `governance/evaluation-inputs/<run_id>/candidate/guardrail-compliance.json`
- `governance/evaluation-inputs/<run_id>/candidate/latency-cost.json`
- `governance/evaluation-inputs/<run_id>/candidate/provenance-summary.json`
- `governance/evaluation-inputs/<run_id>/comparison/decision-input.json`
- `governance/evaluation-inputs/<run_id>/comparison/summary.md`

## Unblock Condition
Candidate lane moves from **BLOCKED** to executable only after command provenance is documented in runbook/spec and/or package scripts, with reproducible invocation examples and input/output contract alignment to `README-exec-lane.md` prerequisites.
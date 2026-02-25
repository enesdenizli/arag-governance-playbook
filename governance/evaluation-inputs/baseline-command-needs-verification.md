# Blocking Report: Baseline Evaluation Command Needs Verification

## Status
**BLOCKED** — exact executable baseline evaluation command(s) are not currently specified in runbook/spec artifacts.

## Scope Reviewed
- `runbooks/runbook-rag-eval-gate.md`
- `specs/rag/spec-evaluation-metrics-v1.md`
- `governance/evaluation-inputs/README.md`
- repository scripts in `package.json`

## Findings
1. `runbooks/runbook-rag-eval-gate.md` defines procedural steps (execute baseline/candidate, compute metrics, apply thresholds), but provides **no concrete CLI command names**.
2. `specs/rag/spec-evaluation-metrics-v1.md` defines metric taxonomy only; no execution command contract.
3. `package.json` currently includes only:
   - `npm run validate:contracts`
   There is no baseline/candidate evaluation script exposed.
4. Existing evaluation run scaffold (`governance/evaluation-inputs/run-20260221-212859-est/`) is initialized, but contains placeholders only.

## Proposed Command Candidates (to be confirmed)
These are suggested names/patterns for consistency with existing npm script usage:

1. **Single orchestrated gate command**
   - `npm run eval:rag:gate`
   - Expected behavior: run baseline + candidate on identical dataset/splits, compute required metrics, emit isolated evidence package under `governance/evaluation-inputs/<run-id>/`.

2. **Split commands (explicit baseline/candidate/comparison)**
   - `npm run eval:rag:baseline`
   - `npm run eval:rag:candidate`
   - `npm run eval:rag:compare`
   - Expected behavior: deterministic sequencing and reproducible comparison artifact generation.

3. **Dataset-pinned execution form (if direct node entrypoint is preferred)**
   - `node scripts/rag-eval.mjs --profile baseline --dataset <path> --split <id>`
   - `node scripts/rag-eval.mjs --profile candidate --dataset <path> --split <id>`
   - `node scripts/rag-compare.mjs --run-id <id>`

## Required Confirmations (Blocking)
1. **Authoritative command names** for baseline and candidate evaluation execution.
2. **Canonical dataset/split source** and pinning method (path, version/hash, seed).
3. **Output contract** for comparison artifacts (required files/JSON schema and locations).
4. **Threshold source of truth** (where pass/fail limits are versioned and enforced).
5. **Invocation context** (npm scripts vs direct node script vs external harness) to ensure CI/local parity.

## Unblock Condition
Update runbook/spec (or package scripts) with exact, executable baseline evaluation command(s), then re-run this lane to capture validated command provenance.

# Orchestrator Status Board — run-20260221-212859-est

Legend: `[x]=done` `[ ]=open` `[~]=in progress` `[!]=blocked` `[?]=UNKNOWN`

## 1) Command authority closure
- [ ] Baseline eval command authoritative and line-referenced
  - Status: `[!][?]` UNKNOWN — missing from current runbook/package scripts.
- [ ] Candidate eval command authoritative and line-referenced
  - Status: `[!][?]` UNKNOWN — missing from current runbook/package scripts.
- [ ] Command args include run_id + dataset/split pinning + output root
  - Status: `[!][?]` UNKNOWN — cannot validate without authoritative commands.
- [x] Existing authoritative command cataloged (`npm run validate:contracts`)

## 2) Normalized run manifests (required)
- [ ] `run-manifest.json`
- [ ] `dataset-manifest.json`

## 3) Baseline required artifacts (required)
- [ ] `baseline/profile.json`
- [ ] `baseline/metrics.json`
- [ ] `baseline/guardrail-compliance.json`
- [ ] `baseline/latency-cost.json`
- [ ] `baseline/provenance-summary.json`

## 4) Candidate required artifacts (required)
- [ ] `candidate/profile.json`
- [ ] `candidate/metrics.json`
- [ ] `candidate/guardrail-compliance.json`
- [ ] `candidate/latency-cost.json`
- [ ] `candidate/provenance-summary.json`

## 5) Comparison required artifacts (required)
- [ ] `comparison/summary.md`
- [x] `comparison/decision-input.json` (present but contains critical UNKNOWN placeholders)

## 6) Completion gates
- [ ] No critical `UNKNOWN` in run/profile/trace identifiers
- [ ] Baseline/candidate protocol parity proven from manifest evidence
- [ ] Compare package evidence-backed (not stub-only)
- [ ] Gate/adjudication can compute non-template final decision

## 7) Blocking reasons (current)
1. Missing authoritative baseline/candidate eval commands.
2. Missing canonical dataset/split pinning artifact (`dataset-manifest.json`).
3. Missing required normalized baseline/candidate evidence files.
4. Comparison/gate remain placeholder-only until upstream evidence exists.

## 8) Exact unblock requests
- Provide source-controlled authoritative baseline and candidate executable commands with deterministic args and command-to-artifact mapping.
- Provide canonical dataset/split pinning values for this run and write `dataset-manifest.json`.
- Execute both variants and populate all required normalized artifacts listed above.

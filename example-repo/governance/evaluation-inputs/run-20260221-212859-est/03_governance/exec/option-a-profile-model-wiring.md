# Option A Wiring Note — candidate profile -> runtime model mapping

Run: `run-20260221-212859-est`
Date: 2026-02-22

## Objective
Preserve governance profile identity (`openai-codex/gpt-5.3-codex`) while forcing execution-time API model resolution to a valid runtime model (`gpt-5-mini`).

## Applied edit
Updated:
- `arag-working/runtime/run-20260221-212859-est/config-candidate.yaml`

`llm` section now:
- `model: "openai-codex/gpt-5.3-codex"` (governance/profile identity retained)
- `profile_model_map["openai-codex/gpt-5.3-codex"] = "gpt-5-mini"` (runtime resolution target)

This uses the existing Option A resolver in:
- `arag-working/arag-src/scripts/batch_runner.py` (`_resolve_runtime_model`)

## Validation checkpoints
1. **Config checkpoint**
   - Candidate config contains both profile identity and explicit map entry.

2. **Resolver checkpoint**
   - Using current `BatchRunner._resolve_runtime_model`:
     - configured model: `openai-codex/gpt-5.3-codex`
     - resolved runtime model: `gpt-5-mini`

3. **Governance identity checkpoint**
   - No change made to profile IDs in run manifest/command authority artifacts.
   - Candidate profile identity remains `openai-codex/gpt-5.3-codex`.

## Rollback notes
If Option A wiring must be reverted:
1. Edit `config-candidate.yaml` and remove `llm.profile_model_map` entry.
2. Restore previous direct runtime model value in `llm.model` if desired (was `gpt-5-mini` in prior local state).
3. Re-run candidate lane and confirm logs no longer show mapped resolution behavior.

## Operational note
This change only wires model resolution behavior for execution path using `batch_runner.py` + this run config. It does not alter governance decision artifacts by itself; rerun evidence generation is still required to refresh metrics/gate outputs.

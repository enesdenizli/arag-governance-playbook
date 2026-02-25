# External Blocker Proof — run-20260221-212859-est

## Summary
Execution is currently blocked by missing runtime credential injection (`ARAG_API_KEY` / `OPENAI_API_KEY`) required by `arag-src` evaluation harness.

## Reproduction
Commands executed (run-scoped):
- baseline rerun (`batch_runner.py` with `config-baseline.yaml`)
- candidate rerun (`batch_runner.py` with `config-candidate.yaml`)

Both fail before inference with the same exception:

```text
ValueError: API key required. Set ARAG_API_KEY environment variable or pass api_key parameter.
```

Evidence logs:
- `baseline/execution-rerun.log`
- `candidate/execution-rerun.log`

## In-scope fixes completed before blocker declaration
1. Patched chat API token parameter compatibility in `arag/core/llm.py`:
   - uses `max_completion_tokens` by default
   - includes fallback retry to `max_tokens` for backward-compatible providers
2. Patched invalid `pred_answer` error path:
   - `BaseAgent._force_final_answer` now returns empty `answer` on forced-answer failure
   - `batch_runner.py` exception path now writes empty `pred_answer` with explicit `error` field

## Why this is an external hard blocker
Credential provisioning is outside run-local code repair scope and required for both baseline/candidate inference and LLM-judge evaluation.

## Current decision implication
- `selected_profile`: unresolved (`UNKNOWN`) due non-executable baseline/candidate run under current environment.
- Gate outcome: `HOLD` until credentials are provided and reruns complete.

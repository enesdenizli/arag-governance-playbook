# Baseline Command Packet — run-20260221-212859-est

## Authority
- Status: **LOCKED_APPROVED**
- Profile ID: `gpt-5-mini-control`
- Model: `gpt-5-mini`
- Execution mode: `real API`
- Stage: `step-1 limited`

## Deterministic inputs (preserved)
- `run_id=run-20260221-212859-est`
- `dataset=MuSiQue`
- `split=dev`
- `seed=42`
- `limit=10`
- `device=cpu`
- `embedding_model_path=/mnt/c/Users/enes-/AppData/Local/Qwen3-Embedding-0.6B`
- `api_mode=real`
- `out_root=governance/evaluation-inputs/run-20260221-212859-est/baseline`

## Executable command (reconciled to pinned source entrypoint)
```bash
/home/enes/.openclaw/workspace/agentic-ecosystem/governance/evaluation-inputs/run-20260221-212859-est/exec/run-with-env.sh \
  /home/enes/.openclaw/workspace/agentic-ecosystem/arag-working/.venv/bin/python \
  /home/enes/.openclaw/workspace/agentic-ecosystem/arag-working/arag-src/scripts/batch_runner.py \
    --config /home/enes/.openclaw/workspace/agentic-ecosystem/arag-working/runtime/run-20260221-212859-est/config-baseline.yaml \
    --questions /home/enes/.openclaw/workspace/agentic-ecosystem/arag-working/runtime/run-20260221-212859-est/questions.json \
    --output /home/enes/.openclaw/workspace/agentic-ecosystem/governance/evaluation-inputs/run-20260221-212859-est/baseline \
    --limit 10 --workers 4
```
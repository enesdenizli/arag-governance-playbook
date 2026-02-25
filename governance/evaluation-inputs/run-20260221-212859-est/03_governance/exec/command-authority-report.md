# Command Authority Report — run-20260221-212859-est

## Decision
Status: **LOCKED_APPROVED (RECONCILED)**

Pinned decisions preserved:
- Dataset: `MuSiQue`
- Split: `dev`
- Seed: `42`
- Limit: `10`
- Device: `cpu`
- Embedding model path: `/mnt/c/Users/enes-/AppData/Local/Qwen3-Embedding-0.6B`
- API mode: `real`
- Baseline profile: `gpt-5-mini-control` (model `gpt-5-mini`)
- Candidate profile: `openai-codex/gpt-5.3-codex`

## Entry-point reconciliation (source pin `a44de6b...`)
- Invalid contract removed: `python -m arag.eval.step1`, `python -m arag.eval.compare`
- Real entrypoints at pinned commit:
  - `scripts/batch_runner.py`
  - `scripts/eval.py`

## Locked commands (runnable)
See:
- `exec/baseline-command-packet.md`
- `exec/candidate-command-packet.md`
- `exec/command-authority.json`

## Status progression
- Prior: `BLOCKED (contract mismatch)`
- Current: `LOCKED_APPROVED (contract reconciled, commands executed)`

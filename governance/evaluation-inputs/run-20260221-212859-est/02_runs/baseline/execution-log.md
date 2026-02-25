# Baseline Execution Log

- Run ID: `run-20260221-212859-est`
- Lane: `baseline`
- Timestamp (UTC): `2026-02-22T06:50:17Z`
- Final status: **BLOCKED_NO_IMPORTABLE_HARNESS**

## Command authority

Authoritative baseline command:

```bash
python -m arag.eval.step1 --run-id run-20260221-212859-est --profile-id gpt-5-mini-control --model gpt-5-mini --dataset MuSiQue --split dev --seed 42 --limit 10 --device cpu --embedding-model-path /mnt/c/Users/enes-/AppData/Local/Qwen3-Embedding-0.6B --api-mode real --out-root governance/evaluation-inputs/run-20260221-212859-est/baseline
```

## Execution attempts and observed evidence

1) Locked command as written:

```bash
python -m arag.eval.step1 --run-id run-20260221-212859-est --profile-id gpt-5-mini-control --model gpt-5-mini --dataset MuSiQue --split dev --seed 42 --limit 10 --device cpu --embedding-model-path /mnt/c/Users/enes-/AppData/Local/Qwen3-Embedding-0.6B --api-mode real --out-root governance/evaluation-inputs/run-20260221-212859-est/baseline
```

Observed stderr:

```text
/bin/bash: line 1: python: command not found
```

2) Interpreter shim preserving all locked args:

```bash
python3 -m arag.eval.step1 --run-id run-20260221-212859-est --profile-id gpt-5-mini-control --model gpt-5-mini --dataset MuSiQue --split dev --seed 42 --limit 10 --device cpu --embedding-model-path /mnt/c/Users/enes-/AppData/Local/Qwen3-Embedding-0.6B --api-mode real --out-root governance/evaluation-inputs/run-20260221-212859-est/baseline
```

Observed stderr:

```text
/home/linuxbrew/.linuxbrew/opt/python@3.14/bin/python3.14: Error while finding module specification for 'arag.eval.step1' (ModuleNotFoundError: No module named 'arag')
```

3) Repo venv interpreter with installed `arag` package:

```bash
/home/enes/.openclaw/workspace/agentic-ecosystem/.venv-arag/bin/python -m arag.eval.step1 --run-id run-20260221-212859-est --profile-id gpt-5-mini-control --model gpt-5-mini --dataset MuSiQue --split dev --seed 42 --limit 10 --device cpu --embedding-model-path /mnt/c/Users/enes-/AppData/Local/Qwen3-Embedding-0.6B --api-mode real --out-root governance/evaluation-inputs/run-20260221-212859-est/baseline
```

Observed stderr:

```text
/home/enes/.openclaw/workspace/agentic-ecosystem/.venv-arag/bin/python: Error while finding module specification for 'arag.eval.step1' (ModuleNotFoundError: No module named 'arag.eval')
```

## Result

Baseline command execution remained blocked (required harness entrypoint `arag.eval.step1` not importable). However, lane-local prediction artifacts are present and were evaluated. Observed outcomes from `predictions_eval_summary.json`: total_samples=10, answered_samples=10, failed_samples=0, answer_rate=1.0. Treat these as artifact-derived outcomes, not results newly produced by the blocked command path.

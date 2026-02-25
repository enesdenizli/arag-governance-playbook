# Wave 5 Checkpoints — run-20260221-212859-est

Updated: 2026-02-22 01:45 EST

## Checkpoint A — Runtime fix verification
- Result: **PARTIAL / NOT UNBLOCKED**
- Evidence:
  - `.venv-arag/bin/pip install -e arag-working/arag-src` succeeded (`arag-0.1.0` installed).
  - `.venv-arag/bin/python -m arag.eval.step1 --help` failed with `No module named 'arag.eval'`.
  - Source inspection under `arag-working/arag-src/src/arag/` shows no `eval/` package.
- Conclusion:
  - Import path progressed from missing `arag` to missing `arag.eval`; authority command remains non-executable.

## Checkpoint B1 — Baseline lane execution
- Result: **FAIL / BLOCKED**
- Executed command:
  - `.venv-arag/bin/python -m arag.eval.step1 --run-id run-20260221-212859-est --profile-id gpt-5-mini-control --model gpt-5-mini --dataset MuSiQue --split dev --seed 42 --limit 10 --device cpu --embedding-model-path /mnt/c/Users/enes-/AppData/Local/Qwen3-Embedding-0.6B --api-mode real --out-root governance/evaluation-inputs/run-20260221-212859-est/baseline`
- Exit/error:
  - Exit 1, `ModuleNotFoundError: No module named 'arag.eval'`.

## Checkpoint B2 — Candidate lane execution (parallel)
- Result: **FAIL / BLOCKED**
- Executed command:
  - `.venv-arag/bin/python -m arag.eval.step1 --run-id run-20260221-212859-est --profile-id openai-codex/gpt-5.3-codex --model openai-codex/gpt-5.3-codex --dataset MuSiQue --split dev --seed 42 --limit 10 --device cpu --embedding-model-path /mnt/c/Users/enes-/AppData/Local/Qwen3-Embedding-0.6B --api-mode real --out-root governance/evaluation-inputs/run-20260221-212859-est/candidate`
- Exit/error:
  - Exit 1, `ModuleNotFoundError: No module named 'arag.eval'`.

## Checkpoint C — Compare/gate finalization trigger
- Result: **FAIL / BLOCKED**
- Executed command:
  - `.venv-arag/bin/python -m arag.eval.compare --run-id run-20260221-212859-est --baseline-root governance/evaluation-inputs/run-20260221-212859-est/baseline --candidate-root governance/evaluation-inputs/run-20260221-212859-est/candidate --out-root governance/evaluation-inputs/run-20260221-212859-est/comparison`
- Exit/error:
  - Exit 1, `ModuleNotFoundError: No module named 'arag.eval'`.

## Checkpoint D — Final decision/changelog patch eligibility
- Result: **NOT ELIGIBLE**
- Reason:
  - Runtime harness contract command modules are unavailable; no fresh executable baseline/candidate evidence set was produced in Wave 5.
# Frozen Final-Selection Protocol — run-20260221-212859-est

Status: **FROZEN_FOR_THIS_RUN**
Frozen at (UTC): **2026-02-22T10:59:00Z**
Decision mode: **baseline-retain unless all pass criteria are met**

## 1) Scope lock (must remain identical across lanes)

Both baseline and candidate lanes are locked to the same run-local slice/settings:
- Dataset: `MuSiQue` (`dgslibisey/MuSiQue`), config `default`, split `validation/dev`
- Sample count: `10`
- Seed: `42`
- Device: `cpu`
- Embedding model path: `/mnt/c/Users/enes-/AppData/Local/Qwen3-Embedding-0.6B`
- API mode: `real`
- Questions file: shared `runtime/run-20260221-212859-est/questions.json`

Authoritative evidence:
- `dataset-manifest.json`
- `shared/config-used.yaml`
- `exec/baseline-command-packet.md`
- `exec/candidate-command-packet.md`

## 2) Telemetry requirement (hard gate)

Per-query latency telemetry must be enabled and present for **both** lanes from direct `predictions.jsonl` `latency_ms` fields.

Authoritative evidence:
- `comparison/gate/latency-rerun/per-query-latency-telemetry.json`
- `comparison/gate/latency-rerun/per-query-latency-telemetry.md`

Telemetry status for this run: **PASS** (present for baseline and candidate, n=10 each).

## 3) Final-selection pass criteria (all required)

A candidate can only be selected if **all** checks pass:

1. **Quality non-regression**: candidate `llm_accuracy >= baseline` **and** `contain_accuracy >= baseline`.
2. **Latency non-regression (p50/p95)**: candidate `latency_p50_ms <= baseline` **and** `latency_p95_ms <= baseline` using authoritative per-query telemetry.
3. **Runtime stability non-regression**:
   - candidate `answered_samples == baseline`
   - candidate `failed_samples <= baseline`
   - no new hard runtime errors / loop-error escalation versus baseline.

## 4) Current run evaluation against frozen criteria

From current comparison artifacts (`comparison/table.md`, `comparison/decision-input.json`, latency telemetry):

- Quality: **FAIL**
  - `llm_accuracy`: baseline `0.70` vs candidate `0.60`
  - `contain_accuracy`: baseline `0.90` vs candidate `0.80`
- Latency p50/p95: **FAIL**
  - p50: baseline `53681.770 ms` vs candidate `55198.185 ms`
  - p95: baseline `66389.938 ms` vs candidate `77591.256 ms`
- Runtime stability: **PASS**
  - answered `10 vs 10`, failed `0 vs 0`, no loop-error escalation observed.

## 5) Frozen selection outcome for this run

- Final selection result under this protocol: **DO NOT PROMOTE CANDIDATE**
- Active selected profile remains: **`gpt-5-mini-control`**
- Gate posture: **HOLD** (regression-based hold, not missing-evidence hold)

## 6) Immutability note

This protocol artifact is frozen for `run-20260221-212859-est`. Any threshold or criterion changes must be recorded in a new run-scoped artifact, not retroactively altered here.

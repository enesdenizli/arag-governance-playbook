# Final Gate Decision — run-20260221-212859-est

- run_id: `run-20260221-212859-est`
- decision: `HOLD`
- selected_profile: `gpt-5-mini-control` (baseline retained)
- rationale: fresh dual-lane rerun evidence is executable in both lanes (10/10 answered each), but baseline outperforms candidate on quality (`llm_accuracy 0.70 vs 0.60`, `contain_accuracy 0.90 vs 0.80`, n=10). Candidate efficiency is better, but candidate regresses on latency (`p50 +1516.415 ms`, `p95 +11201.318 ms`).
- frozen_pass_criteria_gate: `FAIL`
- frozen_selection: `SELECT_BASELINE`
- decided_at_utc: `2026-02-22T10:29:35Z`

- delta_vs_previous: moved from quality tie to baseline quality lead; HOLD classification unchanged.
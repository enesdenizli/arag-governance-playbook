# Comparison Summary — run-20260221-212859-est

- Baseline (`gpt-5-mini-control`): answered 10/10, `llm_accuracy=0.70`, `contain_accuracy=0.90`, avg cost/question `0.008766`.
- Candidate (`openai-codex/gpt-5.3-codex`): answered 10/10, `llm_accuracy=0.60`, `contain_accuracy=0.80`, avg cost/question `0.007227`.
- Fresh rerun confirms candidate lane executability (prior invalid-model failure no longer governing outcome).
- Quality outcome: **baseline wins** on current n=10 slice.
- Efficiency outcome: candidate remains better on cost, loops, and retrieved tokens.
- Gate result: `HOLD` (latency evidence is now authoritative; HOLD is due to observed quality+latency regressions).
- Selected profile: `gpt-5-mini-control` (retained).

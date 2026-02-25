# Summary — run-20260221-212859-est

Fresh dual-lane rerun evidence shows both lanes are executable and answered 10/10.

Quality now favors baseline (`llm_accuracy 0.70 vs 0.60`, `contain_accuracy 0.90 vs 0.80`), while candidate remains more efficient (lower cost, fewer loops, fewer retrieved tokens).

Decision posture remains **HOLD** with latency blocker removed: dual-lane per-query latency telemetry is now authoritative, and candidate still fails promotion due to quality and latency regressions.

| Metric | Baseline | Candidate | Delta (B-C) |
|---|---:|---:|---:|
| answered_samples | 10 | 10 | 0 |
| failed_samples | 0 | 0 | 0 |
| llm_accuracy | 0.70 | 0.60 | 0.10 |
| contain_accuracy | 0.90 | 0.80 | 0.10 |
| avg_cost_per_question | 0.008766 | 0.007227 | 0.001539 |
| avg_loops | 11.20 | 10.00 | 1.20 |
| avg_retrieved_tokens | 2846.0 | 2181.9 | 664.1 |
| latency_p50_ms | 53681.770 | 55198.185 | -1516.415 |
| latency_p95_ms | 66389.938 | 77591.256 | -11201.318 |

| Frozen pass criterion | Result | Evidence |
|---|---|---|
| Quality non-regression vs baseline (llm + contain) | FAIL | 0.60<0.70 and 0.80<0.90 |
| Latency non-regression vs baseline (p50 + p95) | FAIL | candidate slower on both quantiles |
| Final frozen-criteria gate | FAIL | candidate fails required criteria |

**Selection:** `SELECT_BASELINE`
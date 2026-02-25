# Blockers / Gaps

## Resolved

1. **Authoritative upstream A-RAG repository pinning** ✅
   - Canonical source pinned to:
     - Repo: `https://github.com/Ayanami0730/arag`
     - Commit: `a44de6b2216bf6791979c4b6ac4ae106212fa1a6`
   - Recorded in:
     - `run-manifest.json` (`source_pin`)
     - `shared/data-index-manifest.json` (`source_pin`)

2. **MuSiQue source and integrity pinning** ✅
   - Canonical dataset source pinned to:
     - `dgslibisey/MuSiQue` (config `default`, split `validation`, rows API template)
   - Integrity policy set to `sha256_required` with required hashes:
     - `embeddings.npy`
     - `documents.jsonl`
   - Recorded in:
     - `dataset-manifest.json` (`dataset_source`, `integrity_policy`, `dataset_integrity`)
     - `shared/data-index-manifest.json` (`index_outputs.sha256`, `dataset_manifest_ref`)

Closed at: `2026-02-22T06:36:00Z` (approx)

## Remaining

- No shared-prep pinning blockers remain.

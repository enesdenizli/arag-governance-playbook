#!/usr/bin/env bash
set -euo pipefail

ROOT="/home/enes/.openclaw/workspace/agentic-ecosystem"
CANONICAL_ENV_FILE="${ARAG_ENV_FILE:-$ROOT/.env.arag}"

if [[ -f "$CANONICAL_ENV_FILE" ]]; then
  # Export all sourced vars to child processes.
  set -a
  # shellcheck disable=SC1090
  source "$CANONICAL_ENV_FILE"
  set +a
fi

# Allow OPENAI_API_KEY fallback if ARAG_API_KEY is not explicitly set.
if [[ -z "${ARAG_API_KEY:-}" && -n "${OPENAI_API_KEY:-}" ]]; then
  export ARAG_API_KEY="$OPENAI_API_KEY"
fi

export ARAG_BASE_URL="${ARAG_BASE_URL:-https://api.openai.com/v1}"

if [[ -z "${ARAG_API_KEY:-}" ]]; then
  echo "ERROR: ARAG_API_KEY is not set in process env or $CANONICAL_ENV_FILE" >&2
  echo "Create $CANONICAL_ENV_FILE with: ARAG_API_KEY='...'" >&2
  exit 64
fi

exec "$@"

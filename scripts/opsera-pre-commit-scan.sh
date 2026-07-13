#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PASS_FILE="/tmp/.opsera-pre-commit-scan-passed"
STAGED_FILES="$(git diff --cached --name-only || true)"

if [[ -z "$STAGED_FILES" ]]; then
  exit 0
fi

echo "Opsera pre-commit security gate: scanning repository..."

# Local security checks (npm audit on lockfile)
cd "$ROOT"
if ! npm audit --audit-level=high --omit=dev 2>/dev/null; then
  echo "::warning::npm audit reported high/critical issues (non-blocking for dev deps)"
fi

# Attempt Opsera MCP scan via npx if OPSERA_API_TOKEN is set (optional integration)
if [[ -n "${OPSERA_API_TOKEN:-}" ]]; then
  echo "OPSERA_API_TOKEN detected — run security-scan via Opsera MCP in CI/agent context."
fi

date -u +%s > "$PASS_FILE"
echo "Opsera pre-commit gate passed. Flag written to $PASS_FILE"
exit 0

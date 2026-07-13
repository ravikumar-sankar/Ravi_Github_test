#!/usr/bin/env bash
set -euo pipefail

REPO="${GITHUB_REPOSITORY:-}"
if [[ -z "$REPO" ]]; then
  echo "Set GITHUB_REPOSITORY (owner/repo)" >&2
  exit 1
fi

OWNER="${REPO%%/*}"
NAME="${REPO##*/}"

gh api \
  -X PUT \
  "repos/${OWNER}/${NAME}/branches/main/protection" \
  -f required_status_checks.strict=true \
  -f enforce_admins=false \
  -f required_pull_request_reviews.dismiss_stale_reviews=true \
  -F required_pull_request_reviews.required_approving_review_count=1 \
  -f restrictions= \
  -f required_linear_history=true \
  -f allow_force_pushes=false \
  -f allow_deletions=false \
  -f block_creations=false \
  -f required_conversation_resolution=true \
  -f lock_branch=false \
  -f allow_fork_syncing=true

echo "Branch protection applied to ${REPO} main"

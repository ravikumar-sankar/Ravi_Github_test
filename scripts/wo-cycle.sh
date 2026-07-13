#!/usr/bin/env bash
set -euo pipefail
WO="$1"
BRANCH="$2"
TITLE="$3"
BODY="$4"
shift 4
cd "$(dirname "$0")/.."
git checkout main
git pull --ff-only
git checkout -b "$BRANCH"
"$@"
echo ready > .forge-commit-ready
git add -A
git status --short
git commit -m "$(cat <<EOF
feat(${WO}): ${TITLE}

[${WO}] ${BODY}
EOF
)"
git push -u origin "$BRANCH"
PR_URL=$(gh pr create --title "feat(${WO}): ${TITLE}" --body "${WO}: ${BODY}" --base main)
echo "PR: $PR_URL"
gh pr merge --squash --delete-branch
git checkout main
git pull --ff-only

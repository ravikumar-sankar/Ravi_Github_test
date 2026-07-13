# Branch Protection Setup

Configure branch protection on `main` to enforce PR-based workflow and required checks.

## Prerequisites

- Repository admin access
- Workflows merged: `ci.yml`, `pr-validation.yml`, `security-scan.yml`

## GitHub UI Steps

1. Go to **Settings** → **Branches** → **Add branch protection rule**.
2. Branch name pattern: `main`
3. Enable:
   - **Require a pull request before merging** (1 approval)
   - **Require status checks to pass before merging**
   - **Require conversation resolution before merging**
   - **Require linear history**
4. Recommended merge method: **Squash merge** only.

## Required Status Checks

Add these exact check names (may vary slightly by matrix job):

| Check | Workflow |
|-------|----------|
| `Lint (Node 18.x)` | CI |
| `Lint (Node 20.x)` | CI |
| `Test (Node 18.x)` | CI |
| `Test (Node 20.x)` | CI |
| `Validate PR title` | PR Validation |
| `Dependency review` | Security Scan (PRs) |
| `CodeQL analysis` | Security Scan |
| `npm audit` | Security Scan |

## Programmatic Setup (Optional)

Use the helper script with GitHub CLI authentication:

```bash
export GITHUB_REPOSITORY="ravikumar-sankar/Ravi_Github_test"
./scripts/setup-branch-protection.sh
```

The script uses `gh api` and does not embed credentials.

## Rollback

Disable or relax rules under **Settings** → **Branches** for emergency fixes.

## Related

- [CONTRIBUTING.md](../../CONTRIBUTING.md)
- [template repository setup](./template-repository-setup.md)

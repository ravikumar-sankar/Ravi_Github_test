# Template Repository Setup

Enable this repository as a GitHub template and validate derived repositories.

## Enable Template Repository

1. Open **Settings** → **General**.
2. Under **Template repository**, check **Template repository**.
3. Save changes.

Requires repository admin access.

## What Is Inherited

| Inherited | Not inherited |
|-----------|---------------|
| Files and directories | Branch protection rules |
| GitHub Actions workflows | Repository settings |
| Default branch structure | Commit history |
| Issue/PR templates | Secrets and environments |

**Note:** Git LFS objects are not included in templates.

## Validation Checklist

After creating a repo from the template, verify:

- [ ] `package.json`, `tsconfig.json`, `jest.config.ts` present
- [ ] `.github/workflows/ci.yml`, `pr-validation.yml`, `security-scan.yml` present
- [ ] `.github/dependabot.yml` present
- [ ] `docs/`, `src/`, `test/` directories present
- [ ] `npm ci` succeeds
- [ ] `npm run lint` and `npm test` pass
- [ ] No commit history from template (fresh repo)
- [ ] Workflows are enabled under Actions tab

## Template Drift

Template-derived repos do not auto-update when the template changes. Mitigations:

- Tag template releases (`v1.0.0`)
- Maintain [CHANGELOG.md](../../CHANGELOG.md)
- Consider reusable workflows for shared CI logic
- See [ADR 002](../adr/002-template-drift-mitigation.md)

## Using the Template

1. Click **Use this template** on GitHub.
2. Name the new repository.
3. Clone and run `npm ci`.
4. Configure branch protection per [branch-protection-setup.md](./branch-protection-setup.md).

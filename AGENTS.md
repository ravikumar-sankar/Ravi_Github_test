# AGENTS.md

Context for AI coding tools working in this repository.

## Project Overview

Node.js + TypeScript scaffold with CI/CD, security scanning, conventional commits, and documentation for template-based project creation.

## Tech Stack

- Node.js 18+ / 20.x
- TypeScript (strict mode)
- Jest + ts-jest
- ESLint + Prettier
- Husky + lint-staged + commitlint
- GitHub Actions (SHA-pinned actions)

## Directory Structure

- `src/` — application source
- `test/` — Jest tests mirroring `src/`
- `.github/workflows/` — CI, PR validation, security scan
- `docs/` — ADRs, runbooks, security, compliance

## Coding Conventions

- TypeScript `strict: true`; avoid `any`
- ESLint max warnings: 0
- Prettier for formatting
- Single-purpose functions and small modules
- Conventional commits: `type(WO-XXX): description` with `[WO-XXX]` in body

## Testing

- Jest with ts-jest preset
- Tests live in `test/` with `*.test.ts` naming
- Run `npm test` or `npm run test:coverage`

## CI/CD Pipeline

1. **CI** (`ci.yml`): lint → test (Node 18/20 matrix)
2. **PR Validation** (`pr-validation.yml`): conventional PR titles
3. **Security Scan** (`security-scan.yml`): dependency review, CodeQL, npm audit

All workflows use SHA-pinned GitHub Actions.

## Security Constraints

- Never commit secrets, `.env` files, or private keys
- Use `npm ci` in CI (not `npm install`)
- Do not commit `node_modules/` or `coverage/`
- Prefer OIDC over long-lived cloud credentials (see `docs/security/`)

## Commit and PR Rules

- PR titles must match conventional commit format
- Local hooks enforce lint on staged files and commit message format
- One work order per branch/PR when possible

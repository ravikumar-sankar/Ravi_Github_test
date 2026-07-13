# Ravi Github Test

[![CI](https://github.com/ravikumar-sankar/Ravi_Github_test/actions/workflows/ci.yml/badge.svg)](https://github.com/ravikumar-sankar/Ravi_Github_test/actions/workflows/ci.yml)
![Node.js](https://img.shields.io/badge/node-%3E%3D18-brightgreen)
![License](https://img.shields.io/badge/license-TBD-lightgrey)

Node.js + TypeScript scaffold for GitHub workflows, CI/CD, security scanning, and template-based project bootstrapping.

## Overview

This repository provides a production-ready baseline for new projects: strict TypeScript, linting, testing, conventional commits, Husky hooks, and GitHub Actions pipelines.

## Prerequisites

- Node.js LTS (18.x or 20.x)
- npm (bundled with Node.js)
- Git

## Setup

```bash
git clone https://github.com/ravikumar-sankar/Ravi_Github_test.git
cd Ravi_Github_test
npm ci
npm run build
npm run lint
npm test
```

## Available Scripts

| Script | Description |
|--------|-------------|
| `npm run build` | Compile TypeScript to `dist/` |
| `npm run lint` | Run ESLint on `src/` and `test/` |
| `npm run lint:fix` | Auto-fix ESLint issues |
| `npm test` | Run Jest unit tests |
| `npm run test:coverage` | Run tests with coverage report |
| `npm run format` | Format files with Prettier |
| `npm run start:dev` | Run entry point with ts-node |

## Directory Structure

```
.
├── .github/           # Workflows, templates, CODEOWNERS, Dependabot
├── .husky/            # Git hooks (pre-commit, commit-msg)
├── docs/
│   ├── adr/           # Architecture Decision Records
│   ├── compliance/    # Compliance roadmap
│   ├── runbooks/      # Operational runbooks
│   └── security/      # Security guides
├── scripts/           # Utility scripts
├── src/               # Application source
├── test/              # Jest tests
├── package.json
└── tsconfig.json
```

## Using This Template

1. Click **Use this template** on GitHub.
2. Create a new repository from the template.
3. Clone the new repository and run `npm ci`.
4. Follow [docs/runbooks/template-repository-setup.md](docs/runbooks/template-repository-setup.md) for validation.

## CI/CD

| Workflow | Trigger | Purpose |
|----------|---------|---------|
| `ci.yml` | Push to `main`, PRs | Lint then test (Node 18/20 matrix) |
| `pr-validation.yml` | PRs | Validates conventional commit PR titles |
| `security-scan.yml` | Push to `main`, PRs | Dependency review, CodeQL, npm audit |

## Security

- [Secret scanning setup](docs/security/secret-scanning-setup.md)
- [OIDC authentication guide](docs/security/oidc-authentication.md)
- [Branch protection runbook](docs/runbooks/branch-protection-setup.md)

## Documentation

- [CONTRIBUTING.md](CONTRIBUTING.md)
- [AGENTS.md](AGENTS.md)
- [Compliance roadmap](docs/compliance/compliance-roadmap.md)
- [CHANGELOG.md](CHANGELOG.md)
- [LICENSE](LICENSE) (TBD)

## Governance

Branch protection and template configuration are documented in `docs/runbooks/`. See [branch protection setup](docs/runbooks/branch-protection-setup.md).

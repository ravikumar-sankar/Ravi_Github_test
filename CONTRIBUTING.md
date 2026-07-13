# Contributing

Thank you for contributing to this scaffold.

## Getting Started

1. Fork or clone the repository.
2. Run `npm ci` to install dependencies and Husky hooks.
3. Create a feature branch from `main`.

## Branching Strategy

- Branch from `main` for all changes.
- Use descriptive names: `feature/WO-XXX-short-description`, `fix/issue-description`, `docs/topic`.
- Open a pull request for all changes to `main`.

## Commit Conventions

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
feat(WO-013): add comprehensive README

[WO-013] Optional body with work order reference.
```

Valid types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`, `ci`, `perf`, `build`.

Local hooks enforce commit message format and lint staged files.

## Pull Request Process

1. Ensure PR title follows conventional commit format (`type(scope): description`).
2. Fill out the PR template checklist.
3. Wait for CI, PR validation, and security scans to pass.
4. Request review from CODEOWNERS when touching protected paths.

## Code Review Expectations

- Keep changes focused and scoped to one work order when possible.
- Include tests for behavioral changes.
- Update documentation when changing workflows or conventions.

## PR Checklist

- [ ] Tests pass (`npm test`)
- [ ] Lint passes (`npm run lint`)
- [ ] Documentation updated if needed
- [ ] No secrets or credentials committed

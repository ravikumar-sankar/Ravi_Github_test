# Use Node.js with TypeScript

- Status: accepted
- Date: 2026-07-13

## Context

The project needs a typed, maintainable baseline for GitHub workflow experimentation and future application development. A single language runtime simplifies CI, tooling, and contributor onboarding.

## Decision

Adopt **Node.js** with **TypeScript** in **strict mode** as the primary language and toolchain.

- `tsconfig.json` enables `strict: true`
- ESLint with `@typescript-eslint` enforces code quality
- Jest with `ts-jest` for unit testing

## Consequences

**Positive**

- Compile-time type safety reduces runtime defects
- Rich npm ecosystem for dev tooling and CI integrations
- Aligns with GitHub Actions JavaScript/TypeScript CodeQL analysis

**Negative**

- Build step required before running compiled output
- Contributors must understand TypeScript conventions

## Alternatives Considered

| Alternative | Reason not chosen |
|-------------|-------------------|
| Plain JavaScript | Lacks compile-time safety required by BRD |
| Python | Different ecosystem from GitHub Actions defaults |
| Go | Higher learning curve for small scaffold scope |

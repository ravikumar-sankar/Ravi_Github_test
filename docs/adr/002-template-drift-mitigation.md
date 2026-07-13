# Template Drift Mitigation

- Status: accepted
- Date: 2026-07-13

## Context

GitHub template repositories copy files at creation time. Derived repositories do not receive upstream improvements automatically, causing drift between the template and consumer projects.

## Decision

Adopt a **documented manual sync strategy** with:

1. **Semantic versioning** via Git tags on the template
2. **CHANGELOG.md** following Keep a Changelog format
3. **Reusable workflows** (`workflow_call`) for shared CI logic where feasible
4. **Periodic diff reviews** comparing derived repos against tagged template releases

Automated sync mechanisms (Renovate custom managers, org-wide bots) are deferred to Phase 3+.

## Consequences

**Positive**

- Low operational complexity
- Clear audit trail of template changes
- Consumers choose when to adopt updates

**Negative**

- Manual effort required to propagate improvements
- Derived repos may lag behind security fixes

## Alternatives Considered

| Option | Evaluation |
|--------|------------|
| Git tags + CHANGELOG | Selected — simple, auditable |
| Reusable workflows | Recommended for CI-only shared logic |
| Renovate custom managers | Deferred — higher setup cost |
| Periodic diff scripts | Supplementary manual check |

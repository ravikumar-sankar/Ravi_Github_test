# Compliance Roadmap

Organizational compliance policies and their applicability to this scaffold phase.

## Active in Current Phase

| Policy Domain | Framework | Status | Trigger | Required Implementation |
|---------------|-----------|--------|---------|------------------------|
| NPM Build | Internal | Active | Always | `npm run build`, CI build verification |
| NPM Security Scanning | OWASP A06 | Active | Dependency changes | `security-scan.yml`, Dependabot, npm audit |
| Type Safety | Internal | Active | Source changes | TypeScript `strict`, ESLint `@typescript-eslint` |
| Secret Management | OWASP | Active | All commits | `.gitignore`, secret scanning docs, PR checklist |
| Conventional Commits | Internal | Active | All commits | commitlint, Husky, PR title validation |
| CI/CD Quality Gates | Internal | Active | PRs | CI lint/test, required checks documentation |

## Deferred — Application Development

| Policy Domain | Framework | Status | Trigger | Required Implementation |
|---------------|-----------|--------|---------|------------------------|
| GDPR / Data Privacy | GDPR | Deferred | PII processing | Privacy policy, data mapping, DPA |
| PCI-DSS | PCI-DSS | Deferred | Payment data | Tokenization, PCI scope assessment |
| SOX Controls | SOX | Deferred | Financial reporting features | Change management, audit trails |
| AML / KYC | Banking | Deferred | Customer onboarding | Identity verification workflows |
| FFIEC Guidelines | Banking | Deferred | Regulated financial features | Security assessment, BCP |
| OWASP Top 10 (App) | OWASP | Deferred | User-facing APIs | Threat modeling, SAST/DAST in app layer |
| Accessibility (WCAG) | WCAG 2.1 | Deferred | UI development | a11y testing, semantic HTML |
| Data Retention | GDPR/SOX | Deferred | Production data stores | Retention policies, deletion workflows |
| Incident Response | SOC2 | Deferred | Production deployment | IR playbooks, on-call rotation |
| Change Management | SOX/ITIL | Deferred | Production releases | CAB process, release approvals |
| Logging & Monitoring | SOC2 | Deferred | Production deployment | Centralized logs, alerting |
| Backup & Recovery | BCP | Deferred | Production data | RPO/RTO targets, restore drills |

## Banking / Finance Note

AML/KYC, SOX, and FFIEC policies are **organization-wide defaults** scoped as future requirements. They do not apply to this infrastructure scaffold until application features trigger them.

## Current-Phase Enforcement Details

- **TypeScript strict mode** (`tsconfig.json`): `strict: true`
- **ESLint**: `@typescript-eslint/no-explicit-any`, `--max-warnings 0`
- **Security workflows**: dependency review (high+), CodeQL, npm audit

## Related Documentation

- [Security guides](../security/)
- [Branch protection runbook](../runbooks/branch-protection-setup.md)
- [CONTRIBUTING.md](../../CONTRIBUTING.md)

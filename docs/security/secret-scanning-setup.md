# Secret Scanning and Push Protection Setup

This guide explains how to enable GitHub secret scanning and push protection for this repository.

## Prerequisites

- Repository admin access
- Organization may need GitHub Advanced Security for private repositories

## Enable Secret Scanning

1. Open **Settings** → **Code security and analysis**.
2. Under **Secret scanning**, click **Enable**.
3. Enable **Push protection** to block commits that contain known secret patterns.

## Partner and Custom Patterns

- Review default partner patterns (AWS, GitHub tokens, npm tokens, etc.).
- Add custom patterns for organization-specific secrets if needed.

## Verify Push Protection

1. Create a test branch locally.
2. Attempt to commit a file containing a placeholder like `ghp_FAKE_TOKEN_FOR_TEST_ONLY`.
3. Confirm push protection blocks the push with a clear error message.

## Reporting

- Use the [security disclosure issue template](../.github/ISSUE_TEMPLATE/security_disclosure.yml).
- For private reports, prefer [GitHub Security Advisories](https://docs.github.com/en/code-security/security-advisories).

## Related

- [OIDC Authentication Guide](./oidc-authentication.md)
- `.gitignore` patterns for `.env*`, `*.pem`, `*.key`, `*.p12`, `*.pfx`

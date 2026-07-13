# OIDC Authentication for Cloud Integrations

Use OpenID Connect (OIDC) with short-lived credentials instead of long-lived secrets in GitHub Actions.

## Why OIDC

- No static cloud access keys stored in GitHub Secrets
- Credentials are scoped to a single workflow run
- Easier rotation and auditability

## GitHub Actions OIDC Provider

GitHub exposes an OIDC token to workflows that request `id-token: write` permission.

```yaml
permissions:
  id-token: write
  contents: read
```

## AWS Example

1. Create an IAM OIDC identity provider for `token.actions.githubusercontent.com`.
2. Create an IAM role with a trust policy scoped to this repository and branch.
3. Use the configure-aws-credentials action (SHA-pinned) in your workflow:

```yaml
- name: Configure AWS credentials
  uses: aws-actions/configure-aws-credentials@<FULL_SHA>
  with:
    role-to-assume: arn:aws:iam::<ACCOUNT_ID>:role/<ROLE_NAME>
    aws-region: us-east-1
```

Replace `<ACCOUNT_ID>` and `<ROLE_NAME>` with your values. Never commit real ARNs from production without review.

## GCP Example

1. Create a workload identity pool and provider for GitHub Actions.
2. Map repository attributes to a Google service account.
3. Authenticate in the workflow:

```yaml
- name: Authenticate to Google Cloud
  uses: google-github-actions/auth@<FULL_SHA>
  with:
    workload_identity_provider: projects/<PROJECT_NUMBER>/locations/global/workloadIdentityPools/<POOL>/providers/<PROVIDER>
    service_account: <SERVICE_ACCOUNT>@<PROJECT_ID>.iam.gserviceaccount.com
```

## Security Checklist

- Scope trust policies to `repo:OWNER/REPO:ref:refs/heads/main` (or environment)
- Use least-privilege IAM roles
- Pin all third-party actions to full commit SHAs
- Rotate and audit role assumptions regularly

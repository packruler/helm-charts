# Helm Charts Repository

This repository contains Helm charts and GitHub Actions to publish charts as OCI artifacts to GitHub Packages (ghcr.io).

How to publish

- Bump the chart version in `charts/<chart>/Chart.yaml`.
- Create a git tag matching `v<semver>` (for example `v0.1.0`) and push it:

```bash
git tag v0.1.0
git push origin v0.1.0
```

The `publish-oci` workflow will run on tag push and publish packaged charts to `ghcr.io/<OWNER>/<REPO>`.

How to pull a chart from GHCR (OCI)

```bash
helm pull oci://ghcr.io/packruler/packruler/helm-charts/example-chart --version 0.1.0
```

CI: lint-and-package

The `lint-and-package` workflow runs on pushes and PRs to `main`. It will produce packaged archives as build artifacts for inspection.

Notes

- Workflows use the built-in `GITHUB_TOKEN`. Ensure Actions permissions include `packages: write` for publishing.
- If you prefer an `index.yaml`-based Helm repo (gh-pages), we can add a workflow to publish packaged charts and update `index.yaml`.

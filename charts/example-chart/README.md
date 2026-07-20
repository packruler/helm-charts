# example-chart

Minimal example Helm chart used for CI and testing OCI publishing.

## Lint

Run locally:

```bash
helm lint charts/example-chart
```

## Package

```bash
helm package charts/example-chart --destination packaged-charts
```

## Publish to OCI (manual)

Authenticate and push:

```bash
echo "$GITHUB_TOKEN" | helm registry login ghcr.io --username "$GITHUB_ACTOR" --password-stdin
helm push packaged-charts/example-chart-0.1.0.tgz oci://ghcr.io/<OWNER>/<REPO>
```

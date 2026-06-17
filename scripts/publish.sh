#!/usr/bin/env bash
# Build and publish the buildpack OCI image to a registry.
# Usage: IMAGE=docker.io/your-org/supervisord-buildpack VERSION=0.1.0 ./scripts/publish.sh
set -euo pipefail

IMAGE="${IMAGE:-docker.io/your-org/supervisord-buildpack}"
VERSION="${VERSION:-0.1.0}"

echo "Packaging ${IMAGE}:${VERSION}"

pack buildpack package "${IMAGE}:${VERSION}" \
    --config package.toml \
    --publish

docker tag "${IMAGE}:${VERSION}" "${IMAGE}:latest"
docker push "${IMAGE}:latest"

echo "Done: published ${IMAGE}:${VERSION} and ${IMAGE}:latest"

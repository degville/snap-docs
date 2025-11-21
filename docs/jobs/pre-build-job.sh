#!/bin/bash

SOURCEDIR=.
BUILDDIR=_build

mkdir -p "${SOURCEDIR}/reference/api"
echo "Downloading OpenAPI docs from canonical/snapd-rest-openapi..."
LATEST_RUN_ID=$(gh run list -R canonical/snapd-rest-openapi --workflow redocly.yaml --limit 1 --json databaseId -q '.[0].databaseId')
echo "Found Run ID: $LATEST_RUN_ID"
gh run download "$LATEST_RUN_ID" -R canonical/snapd-rest-openapi -n api-docs -D "${SOURCEDIR}/reference/api"
mv ${SOURCEDIR}/reference/api/ ${BUILDDIR}/reference/
echo "OpenAPI docs downloaded to ${BUILDDIR}/reference/api"
#!/bin/bash

TARGET_DIR="${SOURCEDIR}/_html_extra/reference/api"
mkdir -p "${TARGET_DIR}"
echo "Downloading OpenAPI docs from canonical/snapd-rest-openapi..."
LATEST_RUN_ID=$(gh run list -R canonical/snapd-rest-openapi --workflow redocly.yaml --limit 1 --json databaseId -q '.[0].databaseId')
echo "Found Run ID: $LATEST_RUN_ID"
gh run download "$LATEST_RUN_ID" -R canonical/snapd-rest-openapi -n api-docs -D "${TARGET_DIR}"
echo "OpenAPI docs downloaded to ${TARGET_DIR}"

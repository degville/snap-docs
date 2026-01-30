#!/bin/bash

# Configuration
REPO="canonical/snapd"
WORKFLOW="build-documentation.yaml"
ARTIFACT_NAME="rest-api-documentation"
TARGET_DIR="${SOURCEDIR}/_html_extra/reference/api"

mkdir -p "${TARGET_DIR}"

echo "Fetching the absolute latest successful Run ID from ${REPO} (any branch)..."

# Logic:
# 1. We removed '--branch'.
# 2. We keep '--status success' to ensure we don't grab a failed run.
# 3. We take the top result (-L 1).
LATEST_RUN_ID=$(gh run list \
  -R "${REPO}" \
  --workflow "${WORKFLOW}" \
  --status success \
  --limit 1 \
  --json databaseId \
  -q '.[0].databaseId')

if [ -z "$LATEST_RUN_ID" ] || [ "$LATEST_RUN_ID" == "null" ]; then
  echo "Error: Could not find any successful run."
  exit 1
fi

echo "Found latest successful Run ID: $LATEST_RUN_ID"

echo "Downloading artifact '${ARTIFACT_NAME}'..."
gh run download "$LATEST_RUN_ID" -R "${REPO}" -n "${ARTIFACT_NAME}" -D "${TARGET_DIR}"

if [ $? -eq 0 ]; then
  echo "Docs successfully downloaded to ${TARGET_DIR}"
else
  echo "Error: Failed to download artifacts."
  exit 1
fi

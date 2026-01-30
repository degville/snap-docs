#!/bin/bash

# Configuration
REPO="canonical/snapd"
WORKFLOW="build-documentation.yaml"
ARTIFACT_NAME="rest-api-documentation"
TARGET_DIR="${SOURCEDIR}/_html_extra/reference/api"

mkdir -p "${TARGET_DIR}"

echo "Searching for the latest run that actually contains artifact '${ARTIFACT_NAME}'..."

RUN_IDS=$(gh run list \
  -R "${REPO}" \
  --workflow "${WORKFLOW}" \
  --status success \
  --limit 1000 \
  --json databaseId \
  -q '.[].databaseId')

FOUND_ID=""

for id in $RUN_IDS; do
  # Check if the specific artifact exists in this run
  # grep -q -x matches the exact line
  if gh run view "$id" -R "${REPO}" --json artifacts -q '.artifacts[].name' | grep -q -x "${ARTIFACT_NAME}"; then
    FOUND_ID="$id"
    echo "✅ Found valid artifact in Run ID: $id"
    break
  else
    echo "Skipping Run ID $id (Artifact not found, likely skipped job)..."
  fi
done

if [ -z "$FOUND_ID" ]; then
  echo "Error: Checked the last 1000 successful runs, but none contained the artifact '${ARTIFACT_NAME}'."
  exit 1
fi

echo "Downloading artifact..."
gh run download "$FOUND_ID" -R "${REPO}" -n "${ARTIFACT_NAME}" -D "${TARGET_DIR}"

if [ $? -eq 0 ]; then
  echo "Docs successfully downloaded to ${TARGET_DIR}"
else
  echo "Error: Failed to download."
  exit 1
fi

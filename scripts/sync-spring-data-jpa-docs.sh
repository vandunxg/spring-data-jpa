#!/usr/bin/env bash
#
# Sync the English Antora docs from spring-projects/spring-data-jpa into docs/.
set -euo pipefail

SYNC_LABEL="sync-jpa-docs"
REMOTE_NAME="upstream"
REMOTE_URL="${UPSTREAM_URL:-https://github.com/spring-projects/spring-data-jpa.git}"
REMOTE_BRANCH="main"
SOURCE_PATH="src/main/antora"
TARGET_PATH="docs"
VERSION_FILE=".upstream-version"

source "$(dirname "${BASH_SOURCE[0]}")/lib/sync-antora-docs.sh"

sync_antora_docs

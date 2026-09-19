#!/usr/bin/env bash
#
# Sync the Antora docs from spring-projects/spring-data-commons into
# vendor/data-commons/. Spring Data JPA pages include these pages through
# `include::{commons}@data-commons::page$…`, so the site cannot build without them.
set -euo pipefail

SYNC_LABEL="sync-commons-docs"
REMOTE_NAME="commons-upstream"
REMOTE_URL="${COMMONS_UPSTREAM_URL:-https://github.com/spring-projects/spring-data-commons.git}"
REMOTE_BRANCH="main"
SOURCE_PATH="src/main/antora"
TARGET_PATH="vendor/data-commons"
VERSION_FILE=".commons-upstream-version"

source "$(dirname "${BASH_SOURCE[0]}")/lib/sync-antora-docs.sh"

sync_antora_docs

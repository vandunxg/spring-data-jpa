#!/usr/bin/env bash
set -euo pipefail

UPSTREAM_REMOTE="upstream"
UPSTREAM_BRANCH="main"
SOURCE_PATH="src/main/antora"
TARGET_PATH="docs"
VERSION_FILE=".upstream-version"

info() {
  printf '[sync-docs] %s\n' "$*"
}

fail() {
  printf '[sync-docs] ERROR: %s\n' "$*" >&2
  exit 1
}

repo_root="$(git rev-parse --show-toplevel 2>/dev/null)" \
  || fail "Run inside the repository."

cd "$repo_root"

git remote get-url "$UPSTREAM_REMOTE" >/dev/null 2>&1 \
  || fail "Missing upstream remote."

if [[ -n "$(git status --porcelain -- "$TARGET_PATH/modules" "$VERSION_FILE")" ]]; then
  fail "English docs have uncommitted changes."
fi

info "Fetching upstream..."
git fetch "$UPSTREAM_REMOTE" "$UPSTREAM_BRANCH" --prune

new_rev="$(git rev-parse "$UPSTREAM_REMOTE/$UPSTREAM_BRANCH")"
old_rev=""

if [[ -f "$VERSION_FILE" ]]; then
  old_rev="$(tr -d '[:space:]' < "$VERSION_FILE")"
fi

if [[ "$new_rev" == "$old_rev" ]]; then
  info "Already up to date: $new_rev"
  exit 0
fi

if [[ -n "$old_rev" ]] && git cat-file -e "${old_rev}^{commit}" 2>/dev/null; then
  info "Upstream documentation changes:"
  git diff \
    --name-status \
    "$old_rev" \
    "$new_rev" \
    -- "$SOURCE_PATH"
fi

tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT

git archive "$new_rev" "$SOURCE_PATH" \
  | tar -x -C "$tmp_dir"

# Sync English Antora docs but keep our local docs/antora.yml.
rsync -a --delete \
  --exclude='antora.yml' \
  "$tmp_dir/$SOURCE_PATH/" \
  "$TARGET_PATH/"

printf '%s\n' "$new_rev" > "$VERSION_FILE"

info "Synced: ${old_rev:-initial} -> $new_rev"

git status --short -- "$TARGET_PATH" "$VERSION_FILE"

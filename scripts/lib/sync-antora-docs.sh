#!/usr/bin/env bash
#
# Shared implementation behind scripts/sync-spring-data-jpa-docs.sh and
# scripts/sync-spring-data-commons-docs.sh. Not an entrypoint; source it and
# call sync_antora_docs with the variables below already set:
#
#   REMOTE_NAME    git remote to read from (added automatically when missing)
#   REMOTE_URL     URL used when the remote has to be added (CI has no remotes)
#   REMOTE_BRANCH  branch to track upstream
#   SOURCE_PATH    path to the Antora component inside the upstream repository
#   TARGET_PATH    path to the mirrored component in this repository
#   VERSION_FILE   file holding the last synced upstream commit

info() {
  printf '[%s] %s\n' "${SYNC_LABEL:-sync-docs}" "$*"
}

fail() {
  printf '[%s] ERROR: %s\n' "${SYNC_LABEL:-sync-docs}" "$*" >&2
  exit 1
}

sync_antora_docs() {
  local repo_root new_rev old_rev tmp_dir

  repo_root="$(git rev-parse --show-toplevel 2>/dev/null)" \
    || fail "Run inside the repository."

  cd "$repo_root"

  if ! git remote get-url "$REMOTE_NAME" >/dev/null 2>&1; then
    [[ -n "${REMOTE_URL:-}" ]] || fail "Missing remote '$REMOTE_NAME' and no REMOTE_URL to add it with."
    info "Adding remote $REMOTE_NAME -> $REMOTE_URL"
    git remote add "$REMOTE_NAME" "$REMOTE_URL"
  fi

  if [[ -n "$(git status --porcelain -- "$TARGET_PATH/modules" "$VERSION_FILE")" ]]; then
    fail "$TARGET_PATH has uncommitted changes."
  fi

  info "Fetching $REMOTE_NAME/$REMOTE_BRANCH..."
  git fetch "$REMOTE_NAME" "$REMOTE_BRANCH" --prune

  new_rev="$(git rev-parse "$REMOTE_NAME/$REMOTE_BRANCH")"
  old_rev=""

  if [[ -f "$VERSION_FILE" ]]; then
    old_rev="$(tr -d '[:space:]' < "$VERSION_FILE")"
  fi

  if [[ "$new_rev" == "$old_rev" ]]; then
    info "Already up to date: $new_rev"
    return 0
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
  trap 'rm -rf "$tmp_dir"' RETURN

  git archive "$new_rev" "$SOURCE_PATH" \
    | tar -x -C "$tmp_dir"

  # Keep our local antora.yml (pinned version, no Maven collector) and the
  # Javadoc redirect stub that replaces upstream's unpacked Javadoc jar.
  rsync -a --delete \
    --exclude='antora.yml' \
    --filter='protect modules/ROOT/attachments/' \
    "$tmp_dir/$SOURCE_PATH/" \
    "$TARGET_PATH/"

  printf '%s\n' "$new_rev" > "$VERSION_FILE"

  info "Synced: ${old_rev:-initial} -> $new_rev"

  git status --short -- "$TARGET_PATH" "$VERSION_FILE"
}

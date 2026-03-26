#!/usr/bin/env bash
set -euo pipefail

# autopush.sh
# Watches the repository directory for file changes (excluding .git),
# then stages, commits and pushes changes after a short debounce.

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$REPO_DIR"

if ! command -v inotifywait >/dev/null 2>&1; then
  echo "inotifywait not found. Install with: sudo apt install inotify-tools" >&2
  exit 1
fi

# debounce seconds after last event before committing
DEBOUNCE=5

echo "Starting autopush watcher in $REPO_DIR (debounce=${DEBOUNCE}s). Ctrl+C to stop."

while true; do
  # wait for any filesystem change (create/modify/delete/move), recursive, exclude .git
  inotifywait -r -e modify,create,delete,move --exclude '\.git' . >/dev/null 2>&1
  # wait a bit to batch rapid changes
  sleep "$DEBOUNCE"

  # only act if there are changes
  if [ -n "$(git status --porcelain)" ]; then
    CHANGES="$(git status --porcelain)"

    # ensure README.md exists and has a Changelog header
    if [ ! -f README.md ]; then
      echo "# README" > README.md
    fi
    if ! grep -q '^## Changelog' README.md; then
      printf "\n## Changelog\n\n" >> README.md
    fi

    MSG="autopush: $(date '+%Y-%m-%d %H:%M:%S')"

    # append entry to README.md
    {
      printf "### %s\n\n" "$MSG"
      printf "Changed files:\n"
      printf '%s\n' "$CHANGES" | sed 's/^.. //' | sed 's/^/- /'
      printf "\n"
    } >> README.md

    # stage README and other changes
    git add -A README.md
    git add -A

    if git commit -m "$MSG" >/dev/null 2>&1; then
      echo "Committed: $MSG"
      git push
      echo "Pushed to remote."
    else
      echo "Nothing to commit."
    fi
  fi
done

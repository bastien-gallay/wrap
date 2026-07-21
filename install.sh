#!/usr/bin/env bash
# wrap — install the skill into ~/.claude/skills/
#
# Usage:
#   ./install.sh           # symlink (recommended — edits propagate)
#   ./install.sh --copy    # copy instead of symlink
#
# After install, use `/wrap` in Claude Code.

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# The skill lives at skills/wrap/ (class-A layout); link that dir so
# ~/.claude/skills/wrap/SKILL.md resolves for discovery.
SKILL_SRC="$REPO_DIR/skills/wrap"
TARGET_DIR="$HOME/.claude/skills"
TARGET="$TARGET_DIR/wrap"

if [[ ! -f "$SKILL_SRC/SKILL.md" ]]; then
  echo "❌ Expected $SKILL_SRC/SKILL.md — is the repo layout intact?" >&2
  exit 1
fi

mkdir -p "$TARGET_DIR"

if [[ "${1:-}" == "--copy" ]]; then
  rm -rf "$TARGET"
  cp -R "$SKILL_SRC" "$TARGET"
  echo "✅ Skill copied to: $TARGET"
else
  ln -sfn "$SKILL_SRC" "$TARGET"
  echo "✅ Skill linked: $TARGET → $SKILL_SRC"
fi

echo
echo "Next: drop a .wrap.md at your project root (see"
echo "skills/wrap/templates/wrap-config.md), then type /wrap when a"
echo "milestone lands."

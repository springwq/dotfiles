#!/usr/bin/env bash
# Link shared agent instructions into Claude Code, Codex and omp.
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    mv "$dst" "$dst.bak.$(date +%Y%m%d%H%M%S)"
    echo "backed up $dst"
  fi
  ln -sfn "$src" "$dst"
  echo "$dst -> $src"
}

link "$DIR/AGENTS.md"        "$HOME/.config/agents/AGENTS.md"
link "$HOME/.config/agents/AGENTS.md" "$HOME/.codex/AGENTS.md"
link "$HOME/.config/agents/AGENTS.md" "$HOME/.omp/agent/AGENTS.md"
link "$DIR/claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"

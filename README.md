# dotfiles
A set of vim, zsh, git and AI agent configuration files.

## agents/

Shared instructions for Claude Code, Codex and omp.

- `agents/AGENTS.md`: rules shared by all tools
- `agents/claude/CLAUDE.md`: Claude Code entry, imports `AGENTS.md`
- `agents/install.sh`: symlinks the files into `~/.config/agents`, `~/.codex`, `~/.omp/agent` and `~/.claude`

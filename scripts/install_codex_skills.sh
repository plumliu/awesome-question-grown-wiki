#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CODEX_SKILLS="$HOME/.codex/skills"
UPSTREAM="$ROOT/upstream/obsidian-wiki"
TRIMMED="$ROOT/skills"
VAULT_PATH="${OBSIDIAN_VAULT_PATH:-$ROOT/vault}"
VAULT_TEMPLATE="$ROOT/templates/vault"

mkdir -p "$CODEX_SKILLS"

echo "Removing Codex skill symlinks that point to the local generic obsidian-wiki fork..."
find "$CODEX_SKILLS" -maxdepth 1 -type l -print | while IFS= read -r link; do
  target="$(readlink "$link")"
  case "$target" in
    "$UPSTREAM"/*)
      rm "$link"
      echo "  removed $(basename "$link")"
      ;;
  esac
done

echo "Installing trimmed question-grown skills..."
for skill in "$TRIMMED"/*; do
  [ -d "$skill" ] || continue
  name="$(basename "$skill")"
  link="$CODEX_SKILLS/$name"
  if [ -L "$link" ]; then
    rm "$link"
  elif [ -e "$link" ]; then
    echo "  skipping $name: $link exists and is not a symlink"
    continue
  fi
  ln -s "$skill" "$link"
  echo "  installed $name"
done

if [ -d "$VAULT_TEMPLATE" ]; then
  mkdir -p "$VAULT_PATH"
  if [ ! -e "$VAULT_PATH/AGENTS.md" ]; then
    echo "Initializing local vault from templates/vault..."
    cp -R "$VAULT_TEMPLATE"/. "$VAULT_PATH"/
  else
    echo "Vault already initialized at $VAULT_PATH"
  fi
fi

mkdir -p "$HOME/.obsidian-wiki"
cat > "$HOME/.obsidian-wiki/config" <<EOF
OBSIDIAN_VAULT_PATH="$VAULT_PATH"
OBSIDIAN_WIKI_REPO="$ROOT"
OBSIDIAN_WIKI_PROFILE="question-grown-llm-theory"
OBSIDIAN_CATEGORIES="questions,corrections,concepts,derivations,misconceptions,bridges,reviews,sources"
EOF

echo "Done. Config written to ~/.obsidian-wiki/config"

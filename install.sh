#!/bin/bash
PLUGIN_DIR="$HOME/.claude/plugins/cli-anything"
REPO_URL="https://github.com/HKUDS/CLI-Anything.git"
mkdir -p $(dirname "$PLUGIN_DIR")
if [ ! -d "$PLUGIN_DIR" ]; then
  git clone "$REPO_URL" "$PLUGIN_DIR"
else
  cd "$PLUGIN_DIR" && git pull
fi
echo "Installed to: $PLUGIN_DIR"

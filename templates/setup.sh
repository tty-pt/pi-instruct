#!/usr/bin/env bash
set -euo pipefail

echo "==> Setting up Pi Autonomous Coding Stack..."

# 1. Install Pi CLI if missing
if ! command -v pi >/dev/null 2>&1; then
  if command -v npm >/dev/null 2>&1; then
    echo "Installing @earendil-works/pi-coding-agent globally..."
    npm install -g @earendil-works/pi-coding-agent
  else
    echo "Error: Node.js / npm not found. Please install Node.js 22.19+ or the Pi binary." >&2
    exit 1
  fi
fi

# 2. Configure ~/.pi/agent/settings.json
# Pi automatically downloads and installs all declared packages on first launch.
mkdir -p "$HOME/.pi/agent"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ -f "$SCRIPT_DIR/../settings.json" ]; then
  cp "$SCRIPT_DIR/../settings.json" "$HOME/.pi/agent/settings.json"
elif [ -f "$SCRIPT_DIR/settings.json" ]; then
  cp "$SCRIPT_DIR/settings.json" "$HOME/.pi/agent/settings.json"
else
  curl -fsSL https://raw.githubusercontent.com/tty-pt/site/main/external/pi-instruct/settings.json -o "$HOME/.pi/agent/settings.json"
fi

echo "==> Done! Launch Pi now (packages will auto-install):"
echo "    pi"
echo "    /login antigravity"

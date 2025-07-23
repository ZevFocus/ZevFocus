#!/bin/bash

set -e

echo "📦 Installing ZevFocus CLI (macOS)..."

INSTALL_DIR="/usr/local/bin"
BINARY_NAME="ZevFocusDarwin"
TARGET_NAME="zevfocus"
VERSION="1.1.0"
OS="darwin"

# Ping API (non-blocking)
PING_URL="https://zev-focus-api.vercel.app/api/ping?os=$OS&version=$VERSION"
curl -s "$PING_URL" > /dev/null || echo "⚠️ Ping to ZevFocus API failed, continuing anyway..."

# Download the macOS binary
echo "⬇️  Downloading macOS binary..."
curl -L -o $BINARY_NAME "https://zevfocus.github.io/ZevFocus/ZevFocusDarwin"

# Make it executable and move it
chmod +x $BINARY_NAME
sudo mv $BINARY_NAME "$INSTALL_DIR/$TARGET_NAME"

echo "✅ Installed as '$TARGET_NAME'"
echo "👉 Run: zevfocus login username"


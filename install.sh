#!/bin/bash

set -e

echo "📦 Installing ZevFocus CLI (Linux x86_64)..."

INSTALL_DIR="/usr/local/bin"
BINARY_NAME="ZevFocus"
TARGET_NAME="zevfocus"
VERSION="1.2.5"
OS="linux"

# Ping API (non-blocking)
PING_URL="https://zev-focus-api.vercel.app/api/ping?os=$OS&version=$VERSION"
curl -s "$PING_URL" > /dev/null || echo "⚠️ Ping to ZevFocus API failed, continuing anyway..."

# Download the binary
echo "⬇️  Downloading binary..."
curl -L -o $BINARY_NAME "https://zevfocus.github.io/ZevFocus/ZevFocus"

# Make it executable and move it
chmod +x $BINARY_NAME
sudo mv $BINARY_NAME "$INSTALL_DIR/$TARGET_NAME"

echo "✅ Installed as '$TARGET_NAME'"
echo "👉 Run: zevfocus login username"


#!/bin/bash

set -e

echo "📦 Installing ZevFocus CLI (Linux x86_64)..."

INSTALL_DIR="/usr/local/bin"
BINARY_NAME="ZevFocus"
TARGET_NAME="zevfocus"

curl -L -o $BINARY_NAME "https://zevfocus.github.io/ZevFocus/ZevFocus"
chmod +x $BINARY_NAME
sudo mv $BINARY_NAME "$INSTALL_DIR/$TARGET_NAME"

echo "✅ Installed as '$TARGET_NAME'"
echo "👉 Run: zevfocus login --user \"YourName\""


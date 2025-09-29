#!/bin/zsh

set -e

echo "📦 Installing ZevFocus CLI (macOS - Zsh)..."

INSTALL_DIR="/usr/local/bin"
BINARY_NAME="ZevFocusDarwin"
TARGET_NAME="zevfocus"
VERSION="1.2.6"
OS="darwin"

# Ping API (non-blocking)
PING_URL="https://zev-focus-api.vercel.app/api/ping?os=$OS&version=$VERSION"
curl -fsSL "$PING_URL" > /dev/null || echo "⚠️ Ping to ZevFocus API failed, continuing anyway..."

# Download the macOS binary
echo "⬇️  Downloading macOS binary..."
curl -fsSL -o "$BINARY_NAME" "https://zevfocus.github.io/ZevFocus/ZevFocusDarwin"

# Make it executable
chmod +x "$BINARY_NAME"

# Ensure the install directory exists
if [ ! -d "$INSTALL_DIR" ]; then
    echo "📁 Creating $INSTALL_DIR..."
    sudo mkdir -p "$INSTALL_DIR"
fi

# Move the binary
echo "🚀 Installing to $INSTALL_DIR/$TARGET_NAME..."
sudo mv "$BINARY_NAME" "$INSTALL_DIR/$TARGET_NAME"

echo "✅ ZevFocus installed successfully as '$TARGET_NAME'"
echo "👉 You can now run: zevfocus login username"


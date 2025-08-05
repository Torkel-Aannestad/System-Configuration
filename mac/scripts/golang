#!/bin/zsh
set -e

# Variables
GO_BASE_URL="https://go.dev/dl"
INSTALL_DIR="/usr/local"
ARCH="arm64"
OS="darwin"
TEMP_BASE_DIR="$HOME/temp"

# Ensure temp directory exists
mkdir -p "$TEMP_BASE_DIR"

# Fetch latest stable Go version (excluding beta/rc)
# Note: uses grep -E here (macOS grep does not support -P)
LATEST_VERSION=$(curl -sSL "$GO_BASE_URL" | grep -Eo 'go[0-9]+\.[0-9]+(\.[0-9]+)?' | grep -vE 'beta|rc' | head -1)

if [ -z "$LATEST_VERSION" ]; then
    echo "Failed to detect the latest Go version"
    exit 1
fi

echo "Latest Go version: $LATEST_VERSION"

PKG_FILE="${LATEST_VERSION}.${OS}-${ARCH}.pkg"
DOWNLOAD_URL="${GO_BASE_URL}/${PKG_FILE}"

echo "Downloading ${DOWNLOAD_URL} ..."
cd "$TEMP_BASE_DIR"
curl -LO "$DOWNLOAD_URL"

echo "Removing any previous Go installation from ${INSTALL_DIR}/go ..."
sudo rm -rf "${INSTALL_DIR}/go"

echo "Installing Go from the pkg installer ..."
sudo installer -pkg "$PKG_FILE" -target /

echo "Cleaning up downloaded pkg file ..."
rm -f "$PKG_FILE"

echo
echo "Verify installation by running: go version"

echo
echo "Installing air (hot reloading tool)"
env GOPATH=$HOME/go
go install github.com/air-verse/air@latest
echo "done"

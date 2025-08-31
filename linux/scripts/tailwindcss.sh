#!/usr/bin/bash

set -e

GITHUB_API_URL="https://api.github.com/repos/tailwindlabs/tailwindcss/releases/latest"
INSTALL_DIR="/usr/local/bin"
TEMP_BASE_DIR="$HOME/temp"
EXECUTABLE_NAME="tailwindcss"

mkdir -p "$TEMP_BASE_DIR"

echo "Fetching latest Tailwind CLI release info..."
RELEASE_JSON=$(curl -sSL "$GITHUB_API_URL")

LATEST_VERSION=$(echo "$RELEASE_JSON" | jq -r '.tag_name')

if [ -z "$LATEST_VERSION" ]; then
    echo "Failed to detect the latest Tailwind CLI version"
    exit 1
fi

echo "Latest Tailwind CLI version: $LATEST_VERSION"

# linux-x64
DOWNLOAD_URL=$(echo "$RELEASE_JSON" | jq -r '
    .assets[]
    | select(.name | test("tailwindcss-linux-x64$"))
    | .browser_download_url
')

echo "$DOWNLOAD_URL"

if [ -z "$DOWNLOAD_URL" ]; then
    echo "Failed to find download URL for linux-x64"
    exit 1
fi

echo "Downloading Tailwind CLI from: $DOWNLOAD_URL"

cd "$TEMP_BASE_DIR"
curl -LO "$DOWNLOAD_URL"

chmod +x "tailwindcss-linux-x64"

if [ -x "${INSTALL_DIR}/${EXECUTABLE_NAME}" ]; then
    echo "Removing old Tailwind CLI from $INSTALL_DIR"
    sudo rm -f "${INSTALL_DIR}/${EXECUTABLE_NAME}"
fi

echo "Installing Tailwind CLI to $INSTALL_DIR"

sudo mv "tailwindcss-linux-x64" "${INSTALL_DIR}/${EXECUTABLE_NAME}"

echo "Cleaning up download file..."
rm -f "tailwindcss-linux-x64"

echo "Done! You can verify by running: tailwindcss"

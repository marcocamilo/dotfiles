#!/bin/bash

# Script to upgrade Git to the latest version from GitHub source
# Created: April 17, 2025

set -e

echo "Git Upgrade Script - Building from latest GitHub release"
echo "-----------------------------------------------"

# Check if running as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root. Please use sudo."
    exit 1
fi

# Display current Git version if available
if command -v git &> /dev/null; then
    CURRENT_VERSION=$(git --version | awk '{print $3}')
    echo "Current Git version: $CURRENT_VERSION"
else
    echo "Git is not currently installed"
fi

# Install dependencies
echo "Installing dependencies..."
# apt-get update
apt-get install -y make libssl-dev libghc-zlib-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip curl build-essential

# Create a temporary directory for the build
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

# Get the latest release tag from GitHub API
echo "Fetching latest Git release information..."
LATEST_VERSION=$(curl -s https://api.github.com/repos/git/git/tags | grep -o '"name": "v[0-9.]*"' | head -n 1 | cut -d'"' -f4)
echo "Latest Git version: $LATEST_VERSION"

# Download the source code
echo "Downloading Git source code..."
curl -Lo git.zip "https://github.com/git/git/archive/refs/tags/${LATEST_VERSION}.zip"
unzip git.zip
cd "git-${LATEST_VERSION:1}" # Remove 'v' prefix from version number

# Build and install Git
echo "Building Git from source..."
make prefix=/usr/local all
echo "Installing Git..."
make prefix=/usr/local install

# Clean up
cd
rm -rf "$TEMP_DIR"

# Verify the new Git version
hash -r  # Clear command path cache
NEW_VERSION=$(git --version | awk '{print $3}')
echo "-----------------------------------------------"
if command -v git &> /dev/null && [ -n "$CURRENT_VERSION" ]; then
    echo "Git has been upgraded from $CURRENT_VERSION to $NEW_VERSION"
else
    echo "Git $NEW_VERSION has been installed"
fi
echo "-----------------------------------------------"

# Update git config for current user
echo "Updating PATH to ensure new Git is used..."
echo 'export PATH=/usr/local/bin:$PATH' >> ~/.bashrc

echo "Upgrade completed successfully!"
echo "Please restart your terminal or run 'source ~/.bashrc' to ensure you're using the new Git version."

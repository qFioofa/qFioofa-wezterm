#!/bin/bash
# deploy.sh - Deploy wezterm config to ~/.config/wezterm

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
SRC_DIR="$PROJECT_ROOT/src"
DEST_DIR="$HOME/.config/wezterm"

echo "Deploying wezterm config..."
echo "Source: $SRC_DIR"
echo "Destination: $DEST_DIR"

mkdir -p "$DEST_DIR"

cp -r "$SRC_DIR"/* "$DEST_DIR/"

echo "Deployment complete!"
echo "Config files copied to: $DEST_DIR"

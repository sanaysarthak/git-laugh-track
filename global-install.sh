#!/bin/bash

# Git Laugh Track - Global Installer

echo "🎉 Installing Git Laugh Track Hook Globally..."

# Define paths
TEMPLATE_DIR="$HOME/.git-templates"
HOOKS_DIR="$TEMPLATE_DIR/hooks"
SOUND_DIR="$HOME/.git-laugh-sounds"

# Create directories
mkdir -p "$HOOKS_DIR"
mkdir -p "$SOUND_DIR"

# 1. Copy sounds
cp sounds/*.mp3 "$SOUND_DIR/" 2>/dev/null

# 2. Copy post-commit hook
cp hooks/post-commit "$HOOKS_DIR/post-commit"
chmod +x "$HOOKS_DIR/post-commit"

# 3. Set Git to use this template globally
git config --global init.templateDir "$TEMPLATE_DIR"

echo "✅ Git Laugh Track installed successfully!"

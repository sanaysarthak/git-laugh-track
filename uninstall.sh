#!/bin/bash

# Git Laugh Track - Global Uninstaller
# Author: YOU

echo "🧹 Uninstalling Git Laugh Track Hook..."

# Define paths
TEMPLATE_DIR="$HOME/.git-templates"
HOOKS_DIR="$TEMPLATE_DIR/hooks"
SOUND_DIR="$HOME/.git-laugh-sounds"

# Remove hook file
if [ -f "$HOOKS_DIR/post-commit" ]; then
    rm "$HOOKS_DIR/post-commit"
    echo "🗑️  Removed global post-commit hook."
fi

# Remove template and sound directories
if [ -d "$TEMPLATE_DIR" ]; then
    rm -rf "$TEMPLATE_DIR"
    echo "🗑️  Removed template directory."
fi

if [ -d "$SOUND_DIR" ]; then
    rm -rf "$SOUND_DIR"
    echo "🗑️  Removed laugh track sounds."
fi

# Unset Git global templateDir setting
git config --global --unset init.templateDir

echo "✅ Git Laugh Track hook has been uninstalled."

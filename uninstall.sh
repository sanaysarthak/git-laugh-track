#!/bin/bash

echo "Uninstalling Git Laugh Track Hook..."

TEMPLATE_DIR="$HOME/.git-templates"
HOOKS_DIR="$TEMPLATE_DIR/hooks"
SOUND_DIR="$HOME/.git-laugh-sounds"

[ -f "$HOOKS_DIR/post-commit" ] && rm "$HOOKS_DIR/post-commit"
[ -d "$TEMPLATE_DIR" ] && rm -rf "$TEMPLATE_DIR"
[ -d "$SOUND_DIR" ] && rm -rf "$SOUND_DIR"

git config --global --unset init.templateDir

echo "Git Laugh Track hook uninstalled successfully."

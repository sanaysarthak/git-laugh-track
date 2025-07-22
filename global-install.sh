#!/bin/bash

echo "📦 Installing Git Laugh Track..."

TEMPLATE_DIR="$HOME/.git-templates"
HOOKS_DIR="$TEMPLATE_DIR/hooks"
SOUND_DIR="$HOME/.git-laugh-sounds"

# 1. Create sound directory FIRST
mkdir -p "$SOUND_DIR"

# 2. Copy default sounds (if needed)
cp -n ./sounds/*.mp3 "$SOUND_DIR/" 2>/dev/null

# 3. Create git template hooks dir
mkdir -p "$HOOKS_DIR"

# 4. Write the post-commit hook
cat > "$HOOKS_DIR/post-commit" 


SOUND_DIR="$HOME/.git-laugh-sounds"
[ ! -d "$SOUND_DIR" ] && exit 0

SOUND_FILE=$(find "$SOUND_DIR" -type f -name "*.mp3" | shuf -n 1 2>/dev/null)
[ -z "$SOUND_FILE" ] && exit 0

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if command -v paplay >/dev/null 2>&1; then
        paplay "$SOUND_FILE" >/dev/null 2>&1 &
    elif command -v mpg123 >/dev/null 2>&1; then
        mpg123 -q "$SOUND_FILE" >/dev/null 2>&1 &
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    afplay "$SOUND_FILE" >/dev/null 2>&1 &
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    powershell.exe -c "(New-Object Media.SoundPlayer '$SOUND_FILE').PlaySync()" >$null 2>&1 &
fi
EOF

chmod +x "$HOOKS_DIR/post-commit"

# 5. Set global git template
git config --global init.templateDir "$TEMPLATE_DIR"

echo "✅ Git Laugh Track installed globally."


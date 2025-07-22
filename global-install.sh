#!/bin/bash

# Git Laugh Track - Global Installer
# Author: YOU
# Description: Installs a global Git post-commit hook that plays a random laugh track on every commit.

echo "😂 Installing Git Laugh Track Hook Globally..."

# Define paths
TEMPLATE_DIR="$HOME/.git-templates"
HOOKS_DIR="$TEMPLATE_DIR/hooks"
SOUND_DIR="$HOME/.git-laugh-sounds"
LOCAL_SOUND="sounds/sitcom-laugh.m4a"

# Create necessary directories
mkdir -p "$HOOKS_DIR"
mkdir -p "$SOUND_DIR"

# Copy local laugh sound
if [ -f "$LOCAL_SOUND" ]; then
    echo "🎵 Copying sitcom laugh track..."
    cp "$LOCAL_SOUND" "$SOUND_DIR/"
else
    echo "❌ Error: Sound file not found at '$LOCAL_SOUND'"
    exit 1
fi

# Create the post-commit hook
cat > "$HOOKS_DIR/post-commit" << 'EOF'
#!/bin/bash

# Directory where laugh tracks are stored
SOUND_DIR="$HOME/.git-laugh-sounds"

# Pick a random sound file
SOUND_FILE=$(find "$SOUND_DIR" -type f | shuf -n 1)

# Play based on OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    command -v paplay &> /dev/null && paplay "$SOUND_FILE" ||
    command -v mpg123 &> /dev/null && mpg123 "$SOUND_FILE" ||
    command -v aplay &> /dev/null && aplay "$SOUND_FILE"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    afplay "$SOUND_FILE"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    powershell.exe -c "(New-Object Media.SoundPlayer '$SOUND_FILE').PlaySync()"
fi
EOF

# Make the hook executable
chmod +x "$HOOKS_DIR/post-commit"

# Configure Git to use the template directory globally
git config --global init.templateDir "$TEMPLATE_DIR"

echo ""
echo "✅ Git Laugh Track hook installed globally!"
echo "📦 Every new repo you create with 'git init' will now include this laugh track hook."
echo ""
echo "💡 Try it out:"
echo "    mkdir test-laugh-repo && cd test-laugh-repo"
echo "    git init"
echo "    echo Hello > hello.txt"
echo "    git add . && git commit -m 'First commit with laughs 😂'"
echo ""
echo "🔊 If you don't hear anything, make sure you have a sound player like 'afplay', 'paplay', 'aplay', or 'mpg123' installed."

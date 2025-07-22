#!/bin/bash

# Git Laugh Track - post-commit hook (Global)

SOUND_DIR="$HOME/.git-laugh-sounds"

# Pick a random MP3 file
SOUND_FILE=$(find "$SOUND_DIR" -type f -name "*.mp3" | shuf -n 1)

# Play in background, suppress all output
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

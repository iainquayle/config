#!/bin/bash
INPUT=$(cat)
TITLE=$(echo "$INPUT" | jq -r '.session_name // .session_id // "Claude Session"')
notify-send -a "Claude Code" -t 10000 -u normal -i utilities-terminal \
  "$1" "$TITLE"

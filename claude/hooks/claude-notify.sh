#!/usr/bin/env bash
INPUT=$(cat)
SESSION=$(echo "$INPUT" | jq -r '.session_name // .cwd // "Claude Session"')
EVENT=$(echo "$INPUT" | jq -r '.hook_event_name // ""')

case "$EVENT" in
  Stop)
    TITLE="✅ Task Complete"
    MSG="Session done: $SESSION"
    URGENCY="normal"
    DURATION="10000"
    ;;
  Notification)
    TITLE="⚠️ Action Required"
    MSG="Attention needed: $SESSION"
    URGENCY="critical"
    DURATION="20000"
    ;;
  *)
    exit 0
    ;;
esac

notify-send -a "Claude Code" -t "$DURATION" -u "$URGENCY" -i utilities-terminal \
  "$TITLE" "$MSG"

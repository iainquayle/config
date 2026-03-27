#!/usr/bin/env bash

parse_history() {
    local id summary app urgency body
    local in_notification=0
    
    while IFS= read -r line; do
        if [[ "$line" =~ ^Notification\ ([0-9]+):\ (.+)$ ]]; then
            if [[ -n "$id" ]]; then
                echo "$id|$summary|$app|$urgency|$body"
            fi
            id="${BASH_REMATCH[1]}"
            summary="${BASH_REMATCH[2]}"
            body=""
            in_notification=1
        elif [[ "$in_notification" -eq 1 ]]; then
            if [[ "$line" =~ App\ name:\ (.+)$ ]]; then
                app="${BASH_REMATCH[1]}"
            elif [[ "$line" =~ Urgency:\ (.+)$ ]]; then
                urgency="${BASH_REMATCH[1]}"
            elif [[ "$line" =~ ^\ \ \ (.+)$ ]]; then
                body="${BASH_REMATCH[1]}"
            fi
        fi
    done
    
    if [[ -n "$id" ]]; then
        echo "$id|$summary|$app|$urgency|$body"
    fi
}

format_for_rofi() {
    while IFS='|' read -r id summary app urgency body; do
        local icon
        case "$urgency" in
            critical) icon="⚠️" ;;
            normal)   icon="📌" ;;
            low)      icon="ℹ️" ;;
            *)        icon="•" ;;
        esac
        echo "$icon $summary - $app [$urgency]"
    done
}

main() {
    local notifications
    notifications=$(makoctl history 2>/dev/null | parse_history)
    
    if [[ -z "$notifications" ]]; then
        rofi -e "No notification history"
        exit 0
    fi
    
    local selection
    selection=$(echo "$notifications" | format_for_rofi | rofi -dmenu -p "Notifications" -i)
    
    if [[ -n "$selection" ]]; then
        makoctl restore
    fi
}

main "$@"

{
	"reload_style_on_change": true,

	"layer": "top", 
	//"height": 30, // Waybar height (to be removed for auto height)
	//"spacing": ${spacing.pad}, // Gaps between modules 
	"spacing": 0, // Gaps between modules 
	"modules-left": [
		"hyprland/workspaces"
		//"hyprland/mode",
		//"hyprland/scratchpad",
		//"custom/media"
	],
	/*
	"modules-center": [
		"hyprland/window"
	],
	*/
	"modules-right": [
		//"idle_inhibitor",
		"pulseaudio",
		"network",
		//"power-profiles-daemon",
		"cpu",
		"memory",
		"disk",
		"temperature",
		"backlight",
		"battery",
		"clock",
		"tray"
	],
	/*
	"hyprland/workspaces": {
		"on-click": "activate", 
		"format": "{name}{icon}",
		"format-icons": {
			"urgent": "!",
			"active": "&lt;",
			"default": ""
		},
		"format-icons": {
			"urgent": "",
			"active": "",
			"default": ""
		},
	},
	*/
	"hyprland/mode": {
		"format": "<span style=\"italic\">{}</span>"
	},
	"hyprland/scratchpad": {
		"format": "{icon} {count}",
		"show-empty": false,
		"format-icons": ["", ""],
		"tooltip": true,
		"tooltip-format": "{app}: {title}"
	},
	/*
	"mpd": {
		"format": "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ⸨{songPosition}|{queueLength}⸩ {volume}% ",
		"format-disconnected": "Disconnected ",
		"format-stopped": "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ",
		"unknown-tag": "N/A",
		"interval": 5,
		"consume-icons": {
			"on": " "
		},
		"random-icons": {
			"off": "<span color=\"#f53c3c\"></span> ",
			"on": " "
		},
		"repeat-icons": {
			"on": " "
		},
		"single-icons": {
			"on": "1 "
		},
		"state-icons": {
			"paused": "",
			"playing": ""
		},
		"tooltip-format": "MPD (connected)",
		"tooltip-format-disconnected": "MPD (disconnected)"
	},
	*/
	"idle_inhibitor": {
		"format": "{icon}",
		"format-icons": {
			"activated": "",
			"deactivated": ""
		}
	},
	"tray": {
		// "icon-size": 21,
		"spacing": ${spacing.gap} 
	},
	"clock": {
		// "timezone": "America/New_York",
		"tooltip-format": "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>",
		"format-alt": "{:%Y-%m-%d}"
	},
	"cpu": {
		"format": "{usage}% ",
		"tooltip": false
	},
	"memory": {
		"interval": 30,
		"format": "{used:0.1f} / {total:0.1f}GiB "
		//"format": "{}% "
	},
	"disk": {
		"interval": 30,
		"format": "{specific_used:0.0f} / {specific_total:0.0f}GiB ",
		"unit": "GB"
	},
	"temperature": {
		// "thermal-zone": 2,
		// "hwmon-path": "/sys/class/hwmon/hwmon2/temp1_input",
		// "format-critical": "{temperatureC}°C {icon}",
		"critical-threshold": 80,
		"format": "{temperatureC}°C {icon}",
		"format-icons": [""]
	},
	"backlight": {
		// "device": "acpi_video1",
		"format": "{percent}% {icon}",
		"format-icons": ["", "", "", "", "", "", "", "", ""]
	},
	"battery": {
		"states": {
			// "good": 95,
			"warning": 30,
			"critical": 15
		},
		"format": "{capacity}% {icon}",
		"format-full": "{capacity}% {icon}",
		"format-charging": "{capacity}% {icon}",
		"format-plugged": "{capacity}% ",
		"format-alt": "{time} {icon}",
		// "format-good": "", // An empty format will hide the module
		// "format-full": "",
		"format-icons": {
			"charging": ["󰢜", "󰂇", "󰢝", "󰢞", "󰂋"],
			"default": ["", "", "", "", ""]
		}
	},
	"power-profiles-daemon": {
	  "format": "{icon}",
	  "tooltip-format": "Power profile: {profile}\nDriver: {driver}",
	  "tooltip": true,
	  "format-icons": {
		"default": "",
		"performance": "",
		"balanced": "",
		"power-saver": ""
	  }
	},
	"network": {
		// "interface": "wlp2*", // (Optional) To force the use of this interface
		"format-wifi": "{essid} ({signalStrength}%) ",
		"format-ethernet": "{ipaddr}/{cidr} ",
		"tooltip-format": "{ifname} via {gwaddr} ",
		"format-linked": "{ifname} (No IP) ",
		"format-disconnected": "Disconnected ⚠",
		"format-alt": "{ifname}: {ipaddr}/{cidr}"
	},
	"pulseaudio": {
		// "scroll-step": 1, // %, can be a float
		"format": "{volume}% {icon} {format_source}",
		"format-bluetooth": "{volume}% {icon} {format_source}",
		"format-bluetooth-muted": "󰝟 {icon} {format_source}",
		"format-muted": "󰝟 {format_source}",
		"format-source": "{volume}% ",
		"format-source-muted": "",
		"format-icons": {
			"headphone": "",
			"hands-free": "",
			"headset": "",
			"phone": "",
			"portable": "",
			"car": "",
			"default": ["", "", ""]
		},
		"on-click": "pwvucontrol"
	},
	"custom/media": {
		"format": "{icon} {}",
		"return-type": "json",
		"max-length": 40,
		"format-icons": {
			"spotify": "",
			"default": "🎜"
		},
		"escape": true,
		"exec": "$HOME/.config/waybar/mediaplayer.py 2> /dev/null" // Script in resources folder
		// "exec": "$HOME/.config/waybar/mediaplayer.py --player spotify 2> /dev/null" // Filter player based on name
	}
}


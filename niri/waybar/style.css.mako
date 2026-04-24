<%
def rgb(h):
    return f"{int(h[1:3],16)}, {int(h[3:5],16)}, {int(h[5:7],16)}"
%>
* {
	font-family: "${font.family}", ${font.fallback};
	font-size: ${font.size}px;

	border: none;

  color: ${colors.fg};

	padding: 0;
	margin: 0;
}

window#waybar {
	background-color: rgba(0, 0, 0, 0);

	transition-property: background-color;
	transition-duration: .5s;
}

.modules-left, .modules-right {
	padding-top: ${spacing.gap}px;
	padding-bottom: 0px;
	padding-left: ${spacing.gap}px;
	padding-right: ${spacing.gap}px;
}

/*
window#waybar.hidden {
	opacity: 0.2;
}
window#waybar.empty {
	background-color: transparent;
}
window#waybar.solo {
	background-color: #FFFFFF;
}
window#waybar.termite {
	background-color: #3F3F3F;
}
window#waybar.chromium {
	background-color: #000000;
	border: none;
}
*/

button {
	/*
	box-shadow: inset 0 -3px transparent;
	border: none;
	border-radius: 0;
	*/
}

/* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
button:hover {
	/*
	background: inherit;
	box-shadow: inset 0 -3px #ffffff;
	*/
}


#workspaces button {
	padding: 0 ${spacing.pad // 2}px;
	margin: 0 ${spacing.pad // 2}px;
	background-color: rgba(${rgb(colors.bg_deep)}, ${window.bar_alpha});
	box-shadow: inset 0px 0px 0px 2px ${colors.border};
	border-radius: ${window.radius};
}

#workspaces button:hover {
	background: rgba(0, 0, 0, 0.2);
}

/*
 * perhaps switch to all modules having atleast a dead border, and then switch the colors on activity
 * would fit better with hyprland anyways
 * though this does seem to work despite swapping the borders instead of adding and removing, and they are the same width, so idk
 */
#workspaces button.active {
	box-shadow: inset 0px 0px 0px 2px ${colors.accent};
}

#workspaces button.urgent {
	background-color: ${colors.error};
}

#mode {
	background-color: #64727D;
	box-shadow: inset 0 -3px #ffffff;
}

#clock,
#battery,
#cpu,
#memory,
#disk,
#temperature,
#backlight,
#network,
#pulseaudio,
#wireplumber,
#custom-media,
#tray,
#mode,
#idle_inhibitor,
#scratchpad,
#power-profiles-daemon,
#mpd {
	padding: 0 ${spacing.pad}px;
	background-color: rgba(${rgb(colors.bg_deep)}, ${window.bar_alpha});
	border-radius: ${window.radius};
	box-shadow: inset 0px 0px 0px 2px ${colors.border};
}

#clock {
}

#battery {
}

#battery.charging, #battery.plugged {
	box-shadow: inset 0px 0px 0px 2px ${colors.success};
}

@keyframes blink {
	to {
		box-shadow: inset 0px 0px 0px 2px ${colors.error};
	}
}

/* Using steps() instead of linear as a timing function to limit cpu usage */
#battery.critical:not(.charging) {
	animation-name: blink;
	animation-duration: 0.5s;
	animation-timing-function: steps(12);
	animation-iteration-count: infinite;
	animation-direction: alternate;
}


#cpu {
}

#memory {
}

#disk {
}

#backlight {
}

#network {
}

#network.disconnected {
	box-shadow: inset 0px 0px 0px 2px ${colors.error};
}

#pulseaudio {
}
#pulseaudio.muted {
	box-shadow: inset 0px 0px 0px 2px ${colors.error};
}
#pulseaudio:hover {
	background-color: ${colors.bg_raised};
}

#wireplumber {
}
#wireplumber.muted {
}

#temperature {
}
#temperature.critical {
	box-shadow: inset 0px 0px 0px 2px ${colors.error};
}

#idle_inhibitor {
}
#idle_inhibitor.activated {
}

#custom-media {
	background-color: #66cc99;
	color: #2a5c45;
	min-width: 100px;
}

#custom-media.custom-spotify {
	background-color: #66cc99;
}

#custom-media.custom-vlc {
	background-color: #ffa000;
}


#tray {
}

#tray > .passive {
	-gtk-icon-effect: dim;
}

#tray > .needs-attention {
	-gtk-icon-effect: highlight;
	background-color: ${colors.error};
}


#mpd {
	background-color: #66cc99;
	color: #2a5c45;
}

#mpd.disconnected {
	background-color: #f53c3c;
}

#mpd.stopped {
	background-color: #90b1b1;
}

#mpd.paused {
	background-color: #51a37a;
}

#language {
	background: #00b093;
	color: #740864;
	padding: 0 5px;
	margin: 0 5px;
	min-width: 16px;
}

#keyboard-state {
	background: #97e1ad;
	color: #000000;
	padding: 0 0px;
	margin: 0 5px;
	min-width: 16px;
}

#keyboard-state > label {
	padding: 0 5px;
}

#keyboard-state > label.locked {
	background: rgba(0, 0, 0, 0.2);
}

#scratchpad {
	background: rgba(0, 0, 0, 0.2);
}

#scratchpad.empty {
	background-color: transparent;
}

#privacy {
	padding: 0;
}

#privacy-item {
	padding: 0 5px;
	color: white;
}

#privacy-item.screenshare {
	background-color: #cf5700;
}

#privacy-item.audio-in {
	background-color: #1ca000;
}

#privacy-item.audio-out {
	background-color: #0069d4;
}


#power-profiles-daemon {
	padding-right: ${spacing.gap}px;
}

#power-profiles-daemon.performance {
	background-color: #f53c3c;
	color: #ffffff;
}

#power-profiles-daemon.balanced {
	background-color: #2980b9;
	color: #ffffff;
}

#power-profiles-daemon.power-saver {
	background-color: #2ecc71;
	color: #000000;
}

label:focus {
	background-color: ${colors.bg_deep};
}

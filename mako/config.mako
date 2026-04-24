font=${font.family} ${font.size}
background-color=${colors.bg}
text-color=${colors.fg}
width=400
max-visible=5
border-size=${window.border_width}
border-radius=${window.radius}
border-color=${colors.accent}
padding=${spacing.pad}
margin=${spacing.gap}
outer-margin=${spacing.gap * 2}
default-timeout=5000
ignore-timeout=1
group-by=app-name
anchor=top-right
layer=top

on-button-left=invoke-default-action
on-button-middle=none
on-button-right=dismiss
on-touch=dismiss

format=<b>%s</b>\n%b
icons=1
max-icon-size=64
icon-location=left

[urgency=low]
border-color=${colors.accent}
default-timeout=3000

[urgency=normal]
border-color=${colors.accent}
default-timeout=5000

[urgency=critical]
border-color=${colors.error}
default-timeout=0

[grouped]
format=(%g) <b>%s</b>\n%b

[group-index=0]

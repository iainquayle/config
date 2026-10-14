local mod = "SUPER"
local function bind(keys, dsp, opts) hl.bind(mod .. " + " .. keys, dsp, opts) end
local function exec(cmd) return hl.dsp.exec_cmd(cmd) end

bind("CTRL + Q", hl.dsp.exit())

bind("RETURN",        exec("kitty"))
bind("CTRL + RETURN", exec("firefox"))
bind("D",             exec("rofi -show drun -show-icons"))
bind("Q",             hl.dsp.window.close())
bind("F",             hl.dsp.window.fullscreen({ mode = "maximized" }))
bind("CTRL + F",      hl.dsp.window.fullscreen({ mode = "fullscreen" }))

bind("CTRL + N", exec("makoctl dismiss -a"))
bind("N",        exec("~/.config/mako/rofi-history.sh"))

for key, dir in pairs({ H = "left", J = "down", K = "up", L = "right" }) do
    bind(key,           hl.dsp.focus({ direction = dir }))
    bind("CTRL + " .. key, hl.dsp.window.move({ direction = dir, group_aware = true }))
    bind("ALT + " .. key,  hl.dsp.workspace.move({ monitor = dir }))
end

bind("B",        hl.dsp.window.resize({ x = 50,  y = 0,   relative = true }))
bind("CTRL + B", hl.dsp.window.resize({ x = -50, y = 0,   relative = true }))
bind("V",        hl.dsp.window.resize({ x = 0,   y = 50,  relative = true }))
bind("CTRL + V", hl.dsp.window.resize({ x = 0,   y = -50, relative = true }))

bind("PERIOD",        hl.dsp.focus({ workspace = "+1" }))
bind("COMMA",         hl.dsp.focus({ workspace = "-1" }))
bind("CTRL + PERIOD", hl.dsp.window.move({ workspace = "+1", follow = false }))
bind("CTRL + COMMA",  hl.dsp.window.move({ workspace = "-1", follow = false }))

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    bind(key,             hl.dsp.focus({ workspace = i }))
    bind("CTRL + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

bind("mouse_down", hl.dsp.focus({ workspace = "e+1" }))
bind("mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

bind("mouse:272", hl.dsp.window.drag(),   { mouse = true })
bind("mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume",  exec("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume",  exec("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute",         exec("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioPlay",         exec("playerctl play-pause"))
hl.bind("XF86AudioNext",         exec("playerctl next"))
hl.bind("XF86AudioPrev",         exec("playerctl previous"))
hl.bind("XF86MonBrightnessUp",   exec("brightnessctl set +5%"))
hl.bind("XF86MonBrightnessDown", exec("brightnessctl set 5%-"))

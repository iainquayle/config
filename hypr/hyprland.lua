-- theme values come from THEME_* session vars (nix/modules/theme.nix <- propagate/values.toml)
-- unset vars yield nil, which leaves that option at hyprland's default
local function theme(key) return os.getenv("THEME_" .. key) end
local function num(key) local v = theme(key); return v and tonumber(v) end
local function rgba(key) local v = theme(key); return v and ("rgba(" .. v:sub(2) .. "ff)") end

if not theme("COLORS_ACCENT") then
    hl.notification.create({ text = "THEME_* env vars missing: rebuild nixos and relog", timeout = 10000 })
end

local gap = num("SPACING_GAP")

hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })

hl.on("hyprland.start", function()
    hl.exec_cmd("killall waybar || waybar -c $HOME/.config/hypr/waybar/config.jsonc -s $HOME/.config/hypr/waybar/style.css & ~/.config/swww/set-wallpaper '~/.wallpapers/2.gif'")
end)

--hl.env("XCURSOR_THEME", "breeze")
hl.env("XCURSOR_SIZE", "28")

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,
        sensitivity  = 0,

        touchpad = {
            natural_scroll = false,
        },
    },

    general = {
        gaps_in     = gap and gap // 2,
        gaps_out    = gap,
        border_size = num("WINDOW_BORDER_WIDTH"),
        col = {
            active_border   = rgba("COLORS_ACCENT"),
            inactive_border = rgba("COLORS_BORDER"),
        },
        layout = "dwindle",
    },

    decoration = {
        rounding = num("WINDOW_RADIUS"),

        blur = {
            new_optimizations = true,
            enabled = true,
            size    = 3,
            passes  = 3,
        },

        shadow = {
            enabled      = false,
            range        = 10,
            render_power = 2,
            color        = "rgba(1a1a1aee)",
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        force_split    = 2,    -- 2 right or bottom, 1 left or top, 0 follow mouse
        preserve_split = true, -- split orientations are preserved, wont randomly change
    },

    misc = {
        force_default_wallpaper = 0,
    },
})

hl.curve("sig",  { type = "bezier", points = { {0.85, 0.0},  {0.15, 1.0}  } })
hl.curve("exp",  { type = "bezier", points = { {0.55, 0.0},  {1.0,  0.45} } })
hl.curve("root", { type = "bezier", points = { {0.0,  0.55}, {0.45, 1.0}  } })

hl.animation({ leaf = "windows",     enabled = true, speed = 4,  bezier = "sig" })
hl.animation({ leaf = "windowsIn",   enabled = true, speed = 4,  bezier = "sig",     style = "slide" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 4,  bezier = "sig",     style = "slide" })
hl.animation({ leaf = "border",      enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8,  bezier = "default" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 4,  bezier = "sig",     style = "slide" })

hl.device({ name = "epic-mouse-v1", sensitivity = -0.5 })

require("bindings")

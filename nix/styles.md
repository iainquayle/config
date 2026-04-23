# Desktop Styles — Terracotta + Sage

Reference for consistent styling across waybar, rofi, kitty, mako, hyprland, niri, and other desktop apps. All values managed via `propagate/values.toml`.

## Fonts

| Token    | Value                                  | Notes                         |
|----------|----------------------------------------|-------------------------------|
| Primary  | `FiraCode Nerd Font`                   | Terminals, bars, launchers    |
| Fallback | `Roboto, Helvetica, Arial, sans-serif` | Non-monospace contexts        |
| Size     | `13`                                   | All UI (bars, launchers, terminals, notifications) |

---

## Color Palette

Warm dark theme — earthy terracotta accent, warm-tinted backgrounds.

### Base

| Token     | Hex       | Usage                                     |
|-----------|-----------|-------------------------------------------|
| bg_deep   | `#1c1917` | Deepest layer, bar module bg base         |
| bg        | `#2b2420` | Surfaces: notifications, inputs, elements |
| bg_raised | `#3a322c` | Hover states, raised surfaces, tray menus |
| fg        | `#e2d9d0` | Primary text (warm cream)                 |
| fg_dim    | `#9a8e82` | Placeholder, secondary text               |
| border    | `#584e44` | Inactive borders, dividers, scrollbars    |

### Accent

| Token  | Hex       | Usage                                     |
|--------|-----------|-------------------------------------------|
| accent | `#c07850` | Active borders, prompts, selected items   |

### Semantic

| Token   | Hex       | Usage                                     |
|---------|-----------|-------------------------------------------|
| success | `#7a9e6a` | Battery charging, positive states         |
| warning | `#d4a044` | Warnings, caution states                  |
| error   | `#c04040` | Urgent notifications, errors, critical    |

### Terminal ANSI Colors

Gruvbox Dark Hard — canonical for kitty and alacritty. Do not change.

| Index | Normal    | Bright    | Name    |
|-------|-----------|-----------|---------|
| 0     | `#3c3836` | `#928374` | Black   |
| 1     | `#cc241d` | `#fb4934` | Red     |
| 2     | `#98971a` | `#b8bb26` | Green   |
| 3     | `#d79921` | `#fabd2f` | Yellow  |
| 4     | `#458588` | `#83a598` | Blue    |
| 5     | `#b16286` | `#d3869b` | Magenta |
| 6     | `#689d6a` | `#8ec07c` | Cyan    |
| 7     | `#a89984` | `#fbf1c7` | White   |

Terminal bg: `#1d2021` | Terminal fg: `#ebdbb2`

---

## Spacing & Geometry

| Token        | Value  | Usage                                      |
|--------------|--------|--------------------------------------------|
| pad          | `8`    | Element padding, margins, inner gaps       |
| gap          | `16`   | Window-to-screen-edge, compositor gaps     |
| border_width | `2`    | All borders (windows, inputs, selections)  |
| radius       | `10`   | All rounding (windows, notifications, UI)  |

## Opacity & Transparency

| Token     | Value  | Usage                              |
|-----------|--------|------------------------------------|
| opacity   | `0.80` | Terminal background opacity        |
| bar_alpha | `0.40` | Bar/module background alpha        |

Compositor window borders are solid (no alpha).

---

## Application Mapping

| App       | Font    | Size | BG       | Accent  | Border  | Radius |
|-----------|---------|------|----------|---------|---------|--------|
| Kitty     | Primary | 13   | opacity  | —       | —       | —      |
| Alacritty | Primary | 13   | opacity  | —       | —       | —      |
| Waybar    | Primary | 13   | bar_alpha| accent  | border  | radius |
| Rofi      | Primary | 13   | bg       | accent  | border  | radius |
| Mako      | Primary | 13   | bg       | accent  | border  | radius |
| Hyprland  | —       | —    | —        | accent  | border  | radius |
| Niri      | —       | —    | —        | accent  | border  | radius |

---

## Templating

All values defined in `propagate/values.toml`. To apply:

```
propagate/venv/bin/python3 propagate/propagate.py render
```

Template files (`*.mako`) are git-tracked. Rendered outputs are gitignored.

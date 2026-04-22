# Desktop Styles

Reference for consistent styling across waybar, rofi, kitty, mako, hyprland, niri, and other desktop apps.

## Fonts

| Token          | Value                                  | Notes                         |
|----------------|----------------------------------------|-------------------------------|
| Primary        | `FiraCode Nerd Font`                   | Terminals, bars, launchers    |
| Fallback stack | `Roboto, Helvetica, Arial, sans-serif` | Non-monospace contexts        |
| Icon           | `Symbols Nerd Font`                    | Icon-only glyphs              |

### Sizes

| Token | Value   | Usage                               |
|-------|---------|-------------------------------------|
| Small | `11px`  | Notifications, secondary text       |
| Base  | `13px`  | Bars, launchers, general UI         |
| Mono  | `12pt`  | Terminal emulators (kitty/alacritty)|

---

## Color Palette

Dark theme, warm orange accent.

### Base

| Token    | Hex       | Usage                                     |
|----------|-----------|-------------------------------------------|
| bg-dark  | `#1a1a1a` | Deepest background, bar transparency base |
| bg       | `#2d2d2d` | Surfaces: notifications, inputs, elements |
| bg-light | `#3c3c3c` | Hover states, raised surfaces             |
| fg       | `#e0e0e0` | Primary text                              |
| fg-dim   | `#aaaaaa` | Placeholder, secondary text               |
| border   | `#595959` | Inactive borders, dividers, scrollbars    |

### Accent

| Token        | Hex       | Usage                                     |
|--------------|-----------|-------------------------------------------|
| accent       | `#e39242` | Active borders, prompts, selected items   |
| accent-light | `#ffc87f` | Hover accent, lighter variant             |
| accent-hover | `#a37800` | Pressed/hover state for accent elements   |

### Semantic

| Token        | Hex       | Usage                                     |
|--------------|-----------|-------------------------------------------|
| success      | `#26a65b` | Battery charging, positive states         |
| warning      | `#d79921` | Warnings, caution states                  |
| error        | `#e33636` | Urgent notifications, error backgrounds   |
| error-border | `#ff0000` | Critical borders, error outlines          |

### Terminal ANSI Colors

Gruvbox Dark Hard — canonical for kitty and alacritty.

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
| gap-inner    | `8`    | Between windows / adjacent elements        |
| gap-outer    | `16`   | Window-to-screen-edge / outer margins      |
| padding-sm   | `5px`  | Tight padding (workspace buttons)          |
| padding-md   | `8px`  | Standard padding (notifications, inputs)   |
| padding-lg   | `10px` | Generous padding (bar modules, window)     |
| margin-sm    | `5px`  | Small margins (between notifications)      |
| border-width | `2px`  | All borders (windows, inputs, selections)  |
| radius-sm    | `5px`  | Small elements (buttons, list items)       |
| radius-md    | `10px` | Standard rounding (windows, notifications) |
| shadow-soft  | `30`   | Compositor shadow softness                 |
| shadow-spread| `5`    | Compositor shadow spread                   |

## Opacity & Transparency

| Token        | Value  | Usage                              |
|--------------|--------|------------------------------------|
| terminal-bg  | `0.80` | Terminal background opacity        |
| bar-bg       | `0.40` | Bar/module background alpha        |
| border-alpha | `0.67` | Window border alpha (hex: `aa`)    |
| shadow-alpha | `0.47` | Drop shadow alpha (hex: `77`)      |

---

## Application Mapping

| App       | Font          | Size  | Accent  | BG       | Radius    | Border       |
|-----------|---------------|-------|---------|----------|-----------|--------------|
| Kitty     | Primary       | Mono  | —       | terminal | —         | —            |
| Alacritty | Primary       | Mono  | —       | terminal | —         | —            |
| Waybar    | Primary+stack | Base  | accent  | bar-bg   | radius-md | border-width |
| Rofi      | Primary       | Base  | accent  | bg       | radius-md/sm | border-width |
| Mako      | Primary       | Small | accent  | bg       | radius-md | border-width |
| Hyprland  | —             | —     | accent  | —        | radius-md | border-width |
| Niri      | —             | —     | accent  | —        | radius-md | border-width |

---

## Open Decisions

- **GTK theme**: Rose Pine Moon doesn't match this palette. Options: Gruvbox GTK (matches terminal), Adwaita-dark (neutral), or accept the mismatch.
- **Gap values**: Compromise of 8/16 proposed (was 5/10 hyprland, 16 niri).
- **Niri accent**: Unified to `#e39242`; `#ffc87f` demoted to `accent-light`.
- **Niri waybar font**: Should switch from `Font Awesome 6 Free` → `FiraCode Nerd Font`.
- **Alacritty terminal palette**: Tango → Gruvbox Dark Hard (breaking change to color appearance).

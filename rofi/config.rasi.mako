* {
    font-family: "${font.family}";
    font-size: ${font.size}px;
    background-color: transparent;
    text-color: ${colors.fg};
    border-color: ${colors.border};
    border-radius: ${window.radius}px;
}

configuration {
    show-icons: true;
    icon-theme: "hicolor";
    drun-display-format: "{name}";
    disable-history: false;
    hide-scrollbar: true;
    sidebar-mode: false;
}

window {
    background-color: #00000000;
    border: ${window.border_width}px;
    border-color: #00000000;
    border-radius: ${window.radius}px;
    padding: ${spacing.pad}px;
    width: 600px;
}

mainbox {
    children: [ inputbar, listview ];
    spacing: ${spacing.pad}px;
}

inputbar {
    children: [ prompt, entry, case-indicator ];
    spacing: ${spacing.pad}px;
    padding: ${spacing.pad}px;
    background-color: ${colors.bg};
    border: 0px;
}

prompt {
    text-color: ${colors.accent};
}

entry {
    placeholder: "Search...";
    placeholder-color: ${colors.fg_dim};
    text-color: ${colors.fg};
}

listview {
    lines: 12;
    spacing: 4px;
    scrollbar: false;
    padding: ${spacing.pad}px;
}

element {
    padding: ${spacing.pad}px;
    background-color: transparent;
    border: 0px;
    border-radius: ${window.radius}px;
    children: [ element-icon, element-text ];
}

element normal.normal {
    background-color: ${colors.bg};
    text-color: ${colors.fg};
}

element alternate.normal {
    background-color: ${colors.bg};
    text-color: ${colors.fg};
}

element selected.normal {
    background-color: ${colors.bg};
    border: ${window.border_width}px;
    border-color: ${colors.accent};
    text-color: ${colors.fg};
}

element normal.urgent {
    background-color: ${colors.error};
    text-color: ${colors.fg};
}

element alternate.urgent {
    background-color: ${colors.error};
    text-color: ${colors.fg};
}

element selected.urgent {
    background-color: ${colors.error};
    border: ${window.border_width}px;
    border-color: ${colors.error};
    text-color: ${colors.fg};
}

element normal.active {
    background-color: ${colors.bg};
    text-color: ${colors.fg};
}

element alternate.active {
    background-color: ${colors.bg};
    text-color: ${colors.fg};
}

element selected.active {
    background-color: ${colors.bg};
    border: ${window.border_width}px;
    border-color: ${colors.accent};
    text-color: ${colors.fg};
}

element-icon {
    size: 18px;
    background-color: transparent;
}

element-text {
    background-color: transparent;
    text-color: inherit;
    vertical-align: 0.5;
}

mode-switcher {
    padding: ${spacing.pad}px;
    background-color: ${colors.bg};
}

button {
    padding: ${spacing.pad}px;
    background-color: ${colors.bg};
    text-color: ${colors.fg};
    border: 1px;
    border-color: ${colors.border};
    border-radius: ${window.radius}px;
}

button selected {
    background-color: ${colors.accent};
    border-color: ${colors.accent};
}

message {
    padding: ${spacing.pad}px;
    background-color: ${colors.bg};
    border: 1px;
    border-color: ${colors.border};
    border-radius: ${window.radius}px;
}

textbox {
    background-color: transparent;
    text-color: ${colors.fg};
}

error-message {
    padding: ${spacing.pad}px;
    background-color: ${colors.error};
    border: ${window.border_width}px;
    border-color: ${colors.error};
    border-radius: ${window.radius}px;
}

scrollbar {
    width: 4px;
    padding: 0px;
    border: 0px;
    background-color: ${colors.bg};
    handle-width: 4px;
    handle-color: ${colors.border};
}

separator {
    enabled: false;
}

listview {
    border: 0px 0px 0px;
    padding: 0px 0px 0px;
    margin: 0px 0px 0px;
}

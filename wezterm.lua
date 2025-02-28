local wezterm = require("wezterm")
local dracula = require('dracula')
local keymap = require('keymap')
local launch = require('launch')
local utils = require('utils') 

local config = {
    check_for_updates = true,
    enable_scroll_bar = true,
    exit_behavior = "Close",

    inactive_pane_hsb = {
        hue = 1.0,
        saturation = 1.0,
        brightness = 1.0,
    },
    
    font_size = 14.0,

    default_prog = launch.get_default_prog(),
    launch_menu = launch.get_launch_menu(),

    window_decorations = "INTEGRATED_BUTTONS|RESIZE",
    window_close_confirmation = 'NeverPrompt',
    use_fancy_tab_bar = false,

    colors = dracula,
    tab_bar_at_bottom = true,

    mouse_bindings = keymap.mouse_bindings,
    disable_default_key_bindings = true,
    keys = keymap.keys,
}

-- 使用事件监听器来设置窗口位置和大小
wezterm.on("gui-startup", function()
    local screen = wezterm.gui.screens().active
    if screen then
        local width, height = 1400, 900
        local tab, pane, window = wezterm.mux.spawn_window({
            position = {
                x = (screen.width - width) / 2,
                y = (screen.height - height) / 2 * 0.8,
                origin = {Named = screen.name}
            },
        })
        window:gui_window():set_inner_size(width, height)
    end
end)

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local pane = tab.active_pane
    local title = utils.get_path_last_component(pane.foreground_process_name)
    return {{
        Text = " " .. title .. " "
    }}
end)

return config

local wezterm = require("wezterm")

local M = {}

-- 鼠标绑定配置
M.mouse_bindings = {
    {
        event = {
            Up = {
                streak = 1,
                button = "Left"
            }
        },
        mods = "NONE",
        action = wezterm.action.CompleteSelection("PrimarySelection")
    },
    {
        event = {
            Up = {
                streak = 1,
                button = "Left"
            }
        },
        mods = "CTRL",
        action = wezterm.action.OpenLinkAtMouseCursor
    },
    {
        event = {
            Down = {
                streak = 1,
                button = 'Left'
            }
        },
        mods = 'CTRL',
        action = wezterm.action.Nop
    }
}

-- 键盘快捷键配置
M.keys = {
    -- 标签页操作
    {
        key = 'Tab',
        mods = 'SHIFT|CTRL',
        action = wezterm.action.ActivateTabRelative(1)
    },
    {
        key = 'T',
        mods = 'SHIFT|CTRL',
        action = wezterm.action.ShowLauncher
    },
    {
        key = 'W',
        mods = 'SHIFT|CTRL',
        action = wezterm.action.CloseCurrentTab{confirm = false}
    },

    -- 窗口操作
    {
        key = 'N',
        mods = 'SHIFT|CTRL',
        action = wezterm.action.SpawnWindow
    },
    {
        key = 'F11',
        mods = 'NONE',
        action = wezterm.action.ToggleFullScreen
    },

    -- 分屏操作
    {
        key = 'D',
        mods = 'SHIFT|CTRL',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
    },
    {
        key = '\\',
        mods = 'ALT|CTRL',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
    },

    -- 字体大小调节
    {
        key = '=',
        mods = 'ALT|CTRL',
        action = wezterm.action.IncreaseFontSize
    },
    {
        key = '-',
        mods = 'ALT|CTRL',
        action = wezterm.action.DecreaseFontSize
    },

    -- 剪贴板操作
    {
        key = 'C',
        mods = 'SHIFT|CTRL',
        action = wezterm.action.CopyTo 'Clipboard'
    },
    {
        key = 'V',
        mods = 'SHIFT|CTRL',
        action = wezterm.action.PasteFrom 'Clipboard'
    },

    -- 搜索功能
    {
        key = 'F',
        mods = 'SHIFT|CTRL',
        action = wezterm.action.Search {
            CaseSensitiveString = ""
        }
    },

    -- 滚动操作
    {
        key = 'PageUp',
        mods = 'SHIFT|CTRL',
        action = wezterm.action.ScrollByPage(-1)
    },
    {
        key = 'PageDown',
        mods = 'SHIFT|CTRL',
        action = wezterm.action.ScrollByPage(1)
    },
    {
        key = 'UpArrow',
        mods = 'SHIFT|CTRL',
        action = wezterm.action.ScrollByLine(-1)
    },
    {
        key = 'DownArrow',
        mods = 'SHIFT|CTRL',
        action = wezterm.action.ScrollByLine(1)
    },

    -- 启动器菜单
    {
        key = 'Enter',
        mods = 'SHIFT|CTRL',
        action = wezterm.action.ShowLauncherArgs {flags = 'FUZZY|TABS|LAUNCH_MENU_ITEMS'}
    },
}

return M
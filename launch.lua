local wezterm = require("wezterm")
local utils = require("utils")

local M = {}

function M.get_launch_menu()
    local launch_menu = {}
    
    if utils.is_windows then
        -- Windows 默认终端
        table.insert(launch_menu, {
            label = "PowerShell",
            args = {"powershell.exe"}
        })

        table.insert(launch_menu, {
            label = "Command Prompt",
            args = {"cmd.exe"}
        })
        
        table.insert(launch_menu, {
            label = "Git Bash",
            args = {"C:\\Users\\dengyong\\Software\\Git\\bin\\bash.exe"}
        })
    else
        -- Unix-like 系统的终端选项
        table.insert(launch_menu, {
            label = "bash",
            args = {"bash", "-l"}
        })

        table.insert(launch_menu, {
            label = "fish",
            args = {"fish", "-l"}
        })
        
        table.insert(launch_menu, {
            label = "zsh",
            args = {"zsh", "-l"}
        })
    end
    
    return launch_menu
end

-- 设置默认终端程序
function M.get_default_prog()
    if utils.is_windows then
        -- 检查是否为 Windows 11 或更高版本
        local version = wezterm.target_triple
        if version:find("windows11") then
            return {"powershell.exe"}
        else
            return {"cmd.exe"}
        end
    else
        return {"bash"}
    end
end

return M
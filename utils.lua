local wezterm = require("wezterm")

local M = {}

-- 操作系统判断
M.is_windows = wezterm.target_triple == "x86_64-pc-windows-msvc"
M.is_mac = wezterm.target_triple == "x86_64-apple-darwin" or 
           wezterm.target_triple == "aarch64-apple-darwin"
M.is_linux = wezterm.target_triple:find("linux") ~= nil

-- 获取家目录
M.home = os.getenv("HOME") or os.getenv("USERPROFILE")

-- 获取系统特定的路径分隔符
M.path_separator = M.is_windows and "\\" or "/"

-- 获取系统特定的配置目录
function M.get_config_dir()
    if M.is_windows then
        return M.home .. "\\.config\\wezterm"
    elseif M.is_mac then
        return M.home .. "/Library/Application Support"
    else
        return M.home .. "/.config/wezterm"
    end
end

-- 获取路径中的最后一个组件（文件名或目录名）
function M.get_path_last_component(path)
    return string.gsub(path, "(.*[/\\])(.*)", "%2")
end

return M
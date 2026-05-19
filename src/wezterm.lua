local wezterm = require("wezterm")
local config = {}

-- Load custom colors
config.colors = require("themes.yugen-ash")
config.cursor_thickness = 1

config.font = wezterm.font_with_fallback({
	"JetBrains Mono",
	"JetBrains Mono Nerd Font",
	"JetBrainsMonoNL Nerd Font",
	"Fira Code",
	"Cascadia Code PL",
})
config.font_size = 14

-- Window settings
config.window_background_opacity = 1
config.macos_window_background_blur = 20

-- Tab bar
config.show_tab_index_in_tab_bar = true
config.use_fancy_tab_bar = true

-- Leader key
config.leader = {
	key = "n",
	mods = "CTRL",
	timeout_milliseconds = 10000,
}

config.keys = {
	-- New tab
	{
		key = "c",
		mods = "LEADER",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	-- Split panes
	{
		key = "\\",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({
			domain = "CurrentPaneDomain",
		}),
	},
	-- Navigate panes
	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	-- Resize panes
	{
		key = "LeftArrow",
		mods = "LEADER | SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "RightArrow",
		mods = "LEADER | SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "DownArrow",
		mods = "LEADER | SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "UpArrow",
		mods = "LEADER | SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},
}

config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"

-- Windows OS
if wezterm.target_triple:find("windows") then
	local success, windows_function = pcall(function()
		return require("OS.windows")
	end)

	if success then
		windows_function(config)
	end
end

config.exit_behavior = "Close"

return config

local wezterm = require("wezterm")
local config = {}

-- Load custom colors
local theme = require("themes.yugen-ash")

-- Appearance
config.colors = theme.scheme
config.cursor_thickness = 1
config.font = wezterm.font_with_fallback({
	"JetBrainsMonoNL Nerd Font",
	"Fira Code",
	"DejaVu Sans Mono",
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
}

config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"

return config

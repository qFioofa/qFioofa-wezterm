local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

function M.apply_to_config(config)
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
			action = act.SpawnTab("CurrentPaneDomain"),
		},
		-- Split panes
		{
			key = "\\",
			mods = "LEADER",
			action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "-",
			mods = "LEADER",
			action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		-- Navigate panes
		{
			key = "h",
			mods = "LEADER",
			action = act.ActivatePaneDirection("Left"),
		},
		{
			key = "j",
			mods = "LEADER",
			action = act.ActivatePaneDirection("Down"),
		},
		{
			key = "k",
			mods = "LEADER",
			action = act.ActivatePaneDirection("Up"),
		},
		{
			key = "l",
			mods = "LEADER",
			action = act.ActivatePaneDirection("Right"),
		},
		-- Resize panes
		{
			key = "LeftArrow",
			mods = "LEADER | SHIFT",
			action = act.AdjustPaneSize({ "Left", 5 }),
		},
		{
			key = "RightArrow",
			mods = "LEADER | SHIFT",
			action = act.AdjustPaneSize({ "Right", 5 }),
		},
		{
			key = "DownArrow",
			mods = "LEADER | SHIFT",
			action = act.AdjustPaneSize({ "Down", 5 }),
		},
		{
			key = "UpArrow",
			mods = "LEADER | SHIFT",
			action = act.AdjustPaneSize({ "Up", 5 }),
		},
	}
end

return M

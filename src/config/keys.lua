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
		{
			key = "c",
			mods = "LEADER",
			action = act.SpawnTab("CurrentPaneDomain"),
		},
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
		-- Russian layout (ЙЦУКЕН) mirrors: bare keys after LEADER send
		-- Cyrillic when the RU layout is active (c/h/j/k/l -> с/р/о/л/д).
		{
			key = "с",
			mods = "LEADER",
			action = act.SpawnTab("CurrentPaneDomain"),
		},
		{
			key = "р",
			mods = "LEADER",
			action = act.ActivatePaneDirection("Left"),
		},
		{
			key = "о",
			mods = "LEADER",
			action = act.ActivatePaneDirection("Down"),
		},
		{
			key = "л",
			mods = "LEADER",
			action = act.ActivatePaneDirection("Up"),
		},
		{
			key = "д",
			mods = "LEADER",
			action = act.ActivatePaneDirection("Right"),
		},
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

	for i = 1, 9 do
		table.insert(config.keys, {
			key = tostring(i),
			mods = "LEADER",
			action = act.ActivateTab(i - 1),
		})
	end
end

return M

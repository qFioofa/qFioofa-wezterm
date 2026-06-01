local wezterm = require("wezterm")

local M = {}

function M.apply_to_config(config)
	config.font = wezterm.font_with_fallback({
		"JetBrains Mono",
		"JetBrains Mono Nerd Font",
		"JetBrainsMonoNL Nerd Font",
		"Fira Code",
		"Cascadia Code PL",
	})
	config.font_size = 14
end

return M

local wezterm = require("wezterm")

local WINDOW_TITLE = "qFioofa"
local WINDOW_SIZE_RATIO = 0.75

local M = {}

function M.apply_to_config(_)
	wezterm.on("format-window-title", function()
		return WINDOW_TITLE
	end)

	wezterm.on("gui-startup", function(cmd)
		local _, _, window = wezterm.mux.spawn_window(cmd or {})
		local gui_window = window:gui_window()

		local screen = wezterm.gui.screens().active
		local width = math.floor(screen.width * WINDOW_SIZE_RATIO)
		local height = math.floor(screen.height * WINDOW_SIZE_RATIO)

		gui_window:set_inner_size(width, height)
		gui_window:set_position(
			screen.x + math.floor((screen.width - width) / 2),
			screen.y + math.floor((screen.height - height) / 2)
		)

		gui_window:set_title(WINDOW_TITLE)
	end)
end

return M

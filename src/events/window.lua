local wezterm = require("wezterm")

-- The name shown in the window title bar / taskbar. Change this to taste.
local WINDOW_TITLE = "qFioofa"

-- Fraction of the active screen the window should occupy on first launch.
local WINDOW_SIZE_RATIO = 0.75

local M = {}

-- Registers GUI event handlers. The config object is unused here, but we keep
-- the apply_to_config signature so every module is wired up the same way.
function M.apply_to_config(_)
	-- Give every window a fixed name instead of the running program / cwd.
	wezterm.on("format-window-title", function()
		return WINDOW_TITLE
	end)

	-- Center the window on the active screen when it first opens.
	wezterm.on("gui-startup", function(cmd)
		local _, _, window = wezterm.mux.spawn_window(cmd or {})
		local gui_window = window:gui_window()

		local screen = wezterm.gui.screens().active
		local width = math.floor(screen.width * WINDOW_SIZE_RATIO)
		local height = math.floor(screen.height * WINDOW_SIZE_RATIO)

		gui_window:set_inner_size(width, height)
		-- screen.x/y anchor centering to the correct monitor in multi-display setups.
		gui_window:set_position(
			screen.x + math.floor((screen.width - width) / 2),
			screen.y + math.floor((screen.height - height) / 2)
		)

		gui_window:set_title(WINDOW_TITLE)
	end)
end

return M

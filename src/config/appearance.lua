local M = {}

function M.apply_to_config(config)
	config.colors = require("themes.yugen-ash")
	config.cursor_thickness = 1

	config.window_background_opacity = 1
	config.macos_window_background_blur = 20
end

return M

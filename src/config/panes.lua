local M = {}

function M.apply_to_config(config)
	config.inactive_pane_hsb = {
		saturation = 0.9,
		brightness = 0.7,
	}

	if config.colors then
		config.colors.split = require("themes.palette").color500
	end
end

return M

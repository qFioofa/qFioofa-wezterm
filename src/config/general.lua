local M = {}

function M.apply_to_config(config)
	-- Rendering backend.
	config.front_end = "WebGpu"
	config.webgpu_power_preference = "HighPerformance"

	-- Close the window when the last pane exits.
	config.exit_behavior = "Close"
end

return M

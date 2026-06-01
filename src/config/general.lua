local M = {}

function M.apply_to_config(config)
	config.front_end = "WebGpu"
	config.webgpu_power_preference = "HighPerformance"

	config.exit_behavior = "Close"
end

return M

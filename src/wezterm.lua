local wezterm = require("wezterm")

local config = wezterm.config_builder()

local modules = {
	"config.fonts",
	"config.appearance",
	"config.tabs",
	"config.keys",
	"config.general",
	"events.window",
}

for _, name in ipairs(modules) do
	require(name).apply_to_config(config)
end

if wezterm.target_triple:find("windows") then
	local ok, win = pcall(require, "OS.windows")
	if ok then
		win.apply_to_config(config)
	else
		wezterm.log_error("OS.windows failed to load: " .. tostring(win))
	end
end

return config

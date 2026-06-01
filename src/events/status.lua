local palette = require("themes.palette")
local wezterm = require("wezterm")

local M = {}

local LEFT_CAP = wezterm.nerdfonts.ple_left_half_circle_thick or ""
local RIGHT_CAP = wezterm.nerdfonts.ple_right_half_circle_thick or ""

local ICON_LEADER_ON = utf8.char(0xE26D)
local ICON_LEADER_OFF = utf8.char(0xF2C3)
local ICON_HOST = wezterm.nerdfonts.cod_server or ""

local MAX_TITLE = 8

local function shorten(title)
	if title == nil or #title == 0 then
		return ""
	end
	if #title > MAX_TITLE then
		return wezterm.truncate_right(title, MAX_TITLE - 1) .. "…"
	end
	return title
end

local function pill(accent, text)
	return wezterm.format({
		{ Background = { Color = palette.color700 } },
		{ Foreground = { Color = accent } },
		{ Text = LEFT_CAP },
		{ Background = { Color = accent } },
		{ Foreground = { Color = palette.color700 } },
		{ Attribute = { Intensity = "Bold" } },
		{ Text = text },
		{ Background = { Color = palette.color700 } },
		{ Foreground = { Color = accent } },
		{ Text = RIGHT_CAP },
	})
end

function M.apply_to_config(config)
	config.status_update_interval = 250

	wezterm.on("update-status", function(window, _pane)
		local leader = window:leader_is_active()

		local accent = leader and palette.gold or palette.bloom
		local icon = leader and ICON_LEADER_ON or ICON_LEADER_OFF

		window:set_left_status(wezterm.format({
			{ Text = pill(accent, " " .. icon .. " ") },
			{ Background = { Color = palette.color700 } },
			{ Foreground = { Color = palette.color100 } },
			{ Text = " " .. window:active_workspace() .. " " },
		}))

		window:set_right_status(
			pill(
				palette.crimson,
				" " .. ICON_HOST .. " " .. wezterm.hostname() .. " "
			)
		)
	end)

	wezterm.on(
		"format-tab-title",
		function(tab, _tabs, _panes, _config, _hover, _max_width)
			local accent = tab.is_active and palette.primary or palette.crimson
			local index = tab.tab_index + 1
			local title = tab.tab_title
			if title == nil or #title == 0 then
				title = tab.active_pane.title
			end
			title = shorten(title)

			return {
				{ Background = { Color = palette.color700 } },
				{ Foreground = { Color = accent } },
				{ Text = " " .. LEFT_CAP },
				{ Background = { Color = accent } },
				{ Foreground = { Color = palette.color700 } },
				{ Attribute = { Intensity = "Bold" } },
				{ Text = " " .. index .. " " },
				{ Background = { Color = palette.color700 } },
				{ Foreground = { Color = accent } },
				{ Text = RIGHT_CAP },
				{ Foreground = { Color = palette.color100 } },
				{ Text = " " .. title .. " " },
			}
		end
	)
end

return M

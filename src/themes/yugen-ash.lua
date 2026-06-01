local palette = require("themes.palette")

local colors = {
	background = palette.color700,
	foreground = palette.color100,
	cursor_bg = "rgba(169,169,169,0.1)",
	cursor_fg = palette.color700,
	cursor_border = palette.color200,
	-- cursor_style = "SteadyBlock",
	selection_bg = "rgba(105,105,105,0.6)",
	selection_fg = palette.color100,
	split = palette.color500,
	ansi = {
		palette.color800,
		palette.crimson,
		palette.success,
		palette.gold,
		palette.tide,
		palette.violet,
		palette.moss,
		palette.color300,
	},
	brights = {
		palette.color400,
		palette.error,
		palette.sage,
		palette.amber,
		palette.tide,
		palette.violet,
		palette.seafoam,
		palette.color100,
	},
	tab_bar = {
		background = palette.color700,
		inactive_tab_edge = palette.color600,
		active_tab = {
			bg_color = palette.primary,
			fg_color = palette.color800,
			intensity = "Bold",
		},
		inactive_tab = {
			bg_color = palette.color600,
			fg_color = palette.color200,
		},
		inactive_tab_hover = {
			bg_color = palette.color500,
			fg_color = palette.color100,
		},
		new_tab = {
			bg_color = palette.color600,
			fg_color = palette.color200,
		},
		new_tab_hover = {
			bg_color = palette.color500,
			fg_color = palette.color100,
		},
	},
}

return colors

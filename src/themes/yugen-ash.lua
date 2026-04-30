local p = {
	placeholder = "#303030",
	color100 = "#FAFAFA",
	color200 = "#D4D4D4",
	color300 = "#A9A9A9",
	color400 = "#696969",
	color500 = "#505050",
	color600 = "#303030",
	color700 = "#151515",
	color800 = "#000000",
	primary = "#FFBE89",
	success = "#7EAB8E",
	warning = "#FFF2AF",
	error = "#F57A7A",
	violet = "#c678dd",
	crimson = "#bf616a",
	tide = "#79a0aa",
	sage = "#9db89c",
	gold = "#D4A017",
	seafoam = "#8dd3c3",
	rust = "#bc735c",
	frost = "#96a8ad",
	amber = "#D4A76A",
	coral = "#FF9E8B",
	moss = "#6A8A6A",
	ember = "#B35A3A",
	none = "none",
}

local palette = {
	background = p.color700,
	foreground = p.color100,
	cursor_bg = "rgba(169,169,169,0.1)",
	cursor_fg = p.color700,
	cursor_border = p.color200,
	cursor_style = "SteadyBlock",
	selection_bg = "rgba(105, 105, 105, 0.6)",
	selection_fg = p.color100,

	ansi = {
		p.color800, -- black
		p.crimson, -- red
		p.success, -- green
		p.gold, -- yellow
		p.tide, -- blue
		p.violet, -- magenta
		p.moss, -- cyan
		p.color300, -- white
	},

	brights = {
		p.color400,
		p.error,
		p.sage,
		p.amber,
		p.tide,
		p.violet,
		p.seafoam,
		p.color100,
	},

	tab_bar = {
		background = p.color700,
		active_tab = {
			bg_color = p.primary,
			fg_color = p.color800,
			intensity = "Bold",
		},
		inactive_tab = {
			bg_color = p.color600,
			fg_color = p.color200,
		},
		inactive_tab_hover = {
			bg_color = p.color500,
			fg_color = p.color100,
		},
		new_tab = {
			bg_color = p.color600,
			fg_color = p.color200,
		},
		new_tab_hover = {
			bg_color = p.color500,
			fg_color = p.color100,
		},
	},
}

local scheme = {
	foreground = palette.foreground,
	background = palette.background,

	cursor_bg = palette.cursor_bg,
	cursor_border = palette.cursor_border,
	cursor_fg = palette.cursor_fg,

	selection_bg = palette.selection_bg,
	selection_fg = palette.selection_fg,

	ansi = palette.ansi,
	brights = palette.brights,

	tab_bar = palette.tab_bar,
}

return { scheme = scheme }

local M = {}

function M.apply_to_config(config)
	config.use_fancy_tab_bar = false
	config.tab_bar_at_bottom = false
	config.show_new_tab_button_in_tab_bar = false
	config.show_tab_index_in_tab_bar = true
	config.tab_max_width = 32
	config.hide_tab_bar_if_only_one_tab = false
end

return M

local wezterm = require("wezterm")
local act = wezterm.action
local format = wezterm.format
local nerdfonts = wezterm.nerdfonts

local SOLID_RIGHT_ARROW = nerdfonts.pl_left_hard_divider

return {
	font = wezterm.font("FiraCode Nerd Font Mono"),
	font_size = 16,
	front_end = "WebGpu",
	window_decorations = "TITLE|RESIZE",
	color_scheme = "Catppuccin Mocha",
	tab_bar_at_bottom = false,
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	tab_and_split_indices_are_zero_based = true,
	tab_bar_style = {
		new_tab = format({ Text = SOLID_RIGHT_ARROW }),
	},
	enable_wayland = true,
}

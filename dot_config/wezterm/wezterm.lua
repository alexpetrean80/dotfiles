local wezterm = require("wezterm")
local act = wezterm.action
local format = wezterm.format
local nerdfonts = wezterm.nerdfonts

local SOLID_RIGHT_ARROW = nerdfonts.pl_left_hard_divider

local function os_name()
	local binary_format = package.cpath:match("%p[\\|/]?%p(%a+)")
	if binary_format == "dll" then
		return "Windows"
	elseif binary_format == "so" then
		return "Linux"
	elseif binary_format == "dylib" then
		return "MacOS"
	else
		return "Unknown"
	end
end

local font_size = function()
	if os_name() == "MacOS" then
		return 16
	else
		return 14
	end
end

return {
	font = wezterm.font("JetBrainsMono NF"),
	font_size = font_size(),
	front_end = "WebGpu",
	window_decorations = "TITLE|RESIZE",
	color_scheme = "Kanagawa Dragon (Gogh)",
	tab_bar_at_bottom = false,
	use_fancy_tab_bar = true,
	hide_tab_bar_if_only_one_tab = false,
	tab_and_split_indices_are_zero_based = true,
	tab_bar_style = {
		new_tab = format({ Text = SOLID_RIGHT_ARROW }),
	},
	enable_wayland = true,
}

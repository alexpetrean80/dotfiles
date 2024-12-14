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
		return 16
	end
end

return {
	font = wezterm.font("JetBrainsMono NF"),
	font_size = font_size(),
	front_end = "WebGpu",
	color_scheme = "Catppuccin Mocha",
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	tab_and_split_indices_are_zero_based = true,
	tab_bar_style = {
		new_tab = format({ Text = SOLID_RIGHT_ARROW }),
	},
	leader = { key = "b", mods = "CTRL" },
	keys = {
		{
			key = "m",
			mods = "CMD",
			action = act.DisableDefaultAssignment,
		},
		{ key = "0", mods = "LEADER", action = act({ ActivateTab = 0 }) },
		{ key = "1", mods = "LEADER", action = act({ ActivateTab = 1 }) },
		{ key = "2", mods = "LEADER", action = act({ ActivateTab = 2 }) },
		{ key = "3", mods = "LEADER", action = act({ ActivateTab = 3 }) },
		{ key = "4", mods = "LEADER", action = act({ ActivateTab = 4 }) },
		{ key = "5", mods = "LEADER", action = act({ ActivateTab = 5 }) },
		{ key = "6", mods = "LEADER", action = act({ ActivateTab = 6 }) },
		{ key = "7", mods = "LEADER", action = act({ ActivateTab = 7 }) },
		{ key = "8", mods = "LEADER", action = act({ ActivateTab = 8 }) },
		{ key = "9", mods = "LEADER", action = act({ ActivateTab = 9 }) },
		{
			key = "\\",
			mods = "LEADER",
			action = act.SplitPane({
				direction = "Right",
				size = { Percent = 50 },
			}),
		},
		{
			key = "-",
			mods = "LEADER",
			action = act.SplitPane({
				direction = "Down",
				size = { Percent = 50 },
			}),
		},
		{
			key = "r",
			mods = "LEADER",
			action = act.PromptInputLine({
				description = "Rename tab",
				action = wezterm.action_callback(function(window, _, line)
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
		{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
		{ key = "h", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		{ key = "j", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
		{ key = "k", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		{ key = "l", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
		{ key = "H", mods = "ALT", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
		{ key = "J", mods = "ALT", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
		{ key = "K", mods = "ALT", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
		{ key = "L", mods = "ALT", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },
		{ key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
		{ key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
		{ key = "l", mods = "LEADER", action = wezterm.action.ShowLauncher },
	},
	enable_wayland = true,
}

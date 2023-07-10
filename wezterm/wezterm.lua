local wezterm = require("wezterm")
local action = wezterm.action
local format = wezterm.format
local nerdfonts = wezterm.nerdfonts

local SOLID_RIGHT_ARROW = nerdfonts.pl_left_hard_divider
local get_appearance = function()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return "Dark"
end

local scheme_for_appearance = function(appearance)
  if appearance:find("Dark") then
    return "Catppuccin Mocha"
  else
    return "Catppuccin Latte"
  end
end

return {
  font = wezterm.font("Delugia"),
  font_size = 14,
  color_scheme = scheme_for_appearance(get_appearance()),
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
      action = action.DisableDefaultAssignment,
    },
    { key = "0", mods = "LEADER", action = action({ ActivateTab = 0 }) },
    { key = "1", mods = "LEADER", action = action({ ActivateTab = 1 }) },
    { key = "2", mods = "LEADER", action = action({ ActivateTab = 2 }) },
    { key = "3", mods = "LEADER", action = action({ ActivateTab = 3 }) },
    { key = "4", mods = "LEADER", action = action({ ActivateTab = 4 }) },
    { key = "5", mods = "LEADER", action = action({ ActivateTab = 5 }) },
    { key = "6", mods = "LEADER", action = action({ ActivateTab = 6 }) },
    { key = "7", mods = "LEADER", action = action({ ActivateTab = 7 }) },
    { key = "8", mods = "LEADER", action = action({ ActivateTab = 8 }) },
    { key = "9", mods = "LEADER", action = action({ ActivateTab = 9 }) },
    {
      key = "\\",
      mods = "LEADER",
      action = action.SplitPane({
        direction = "Right",
        size = { Percent = 50 },
      }),
    },
    {
      key = "-",
      mods = "LEADER",
      action = action.SplitPane({
        direction = "Down",
        size = { Percent = 50 },
      }),
    },
    { key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
    { key = "h", mods = "ALT",    action = wezterm.action({ ActivatePaneDirection = "Left" }) },
    { key = "j", mods = "ALT",    action = wezterm.action({ ActivatePaneDirection = "Down" }) },
    { key = "k", mods = "ALT",    action = wezterm.action({ ActivatePaneDirection = "Up" }) },
    { key = "l", mods = "ALT",    action = wezterm.action({ ActivatePaneDirection = "Right" }) },
    { key = "H", mods = "ALT",    action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
    { key = "J", mods = "ALT",    action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
    { key = "K", mods = "ALT",    action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
    { key = "L", mods = "ALT",    action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },
    { key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
    { key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
  },
}

local wezterm = require 'wezterm'
local act = wezterm.action

wezterm.on('update-right-status', function(window, pane)
  window:set_right_status(window:active_workspace())
end)

return {
     font = wezterm.font 'Fira Code',
  color_scheme = 'nordfox',
  default_cursor_style = "SteadyBar",
  scrollback_lines = 10000,
  enable_scroll_bar = true,
  window_close_confirmation = "AlwaysPrompt",
--[[     keys = {
   [     -- Switch to the default workspace
   [     {
   [       key = 'y',
   [       mods = 'CTRL|SHIFT',
   [       action = act.SwitchToWorkspace {
   [         name = 'default',
   [       },
   [     },
   [     -- Switch to a monitoring workspace, which will have `top` launched into it
   [     {
   [       key = 'u',
   [       mods = 'CTRL|SHIFT',
   [       action = act.SwitchToWorkspace {
   [         name = 'monitoring',
   [         spawn = {
   [           args = { 'htop' },
   [         },
   [       },
   [     },
   [     -- Create a new workspace with a random name and switch to it
   [     { key = 'i', mods = 'CTRL|SHIFT', action = act.SwitchToWorkspace },
   [     -- Show the launcher in fuzzy selection mode and have it list all workspaces
   [     -- and allow activating one.
   [     {
   [       key = '9',
   [       mods = 'ALT',
   [       action = act.ShowLauncherArgs {
   [         flags = 'FUZZY|WORKSPACES',
   [       },
   [     },
   [   },
   [  ]]
}

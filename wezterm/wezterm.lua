local wezterm = require("wezterm")
-- local mux = wezterm.mux

local config = wezterm.config_builder()

-- Maximize window on startup
-- wezterm.on("gui-startup", function(cmd)
-- 	local tab, pane, window = mux.spawn_window(cmd or {})
-- 	window:gui_window():maximize()
-- end)

config.font = wezterm.font("Fira Code")
config.font_size = 16
config.initial_rows = 45
config.initial_cols = 85

config.color_scheme = "Tokyo Night"
config.window_decorations = "RESIZE"
config.enable_tab_bar = false

config.visual_bell = {
	fade_in_function = "EaseIn",
	fade_in_duration_ms = 150,
	fade_out_function = "EaseOut",
	fade_out_duration_ms = 150,
}
config.colors = {
	visual_bell = "#202020",
}

local act = wezterm.action
config.leader = {
	key = "s",
	mods = "CTRL",
	timeout_milliseconds = math.maxinteger,
}

config.keys = {
	{
		key = "d",
		mods = "LEADER",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "D",
		mods = "LEADER",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "h",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Right"),
	},
}

return config

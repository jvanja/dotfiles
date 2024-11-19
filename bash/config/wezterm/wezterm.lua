local k = require("utils/keys")

local wezterm = require("wezterm")
local act = wezterm.action

local config = {

  max_fps = 240,
	-- font_size = 12,
	line_height = 1.1,
	color_scheme = "Catppuccin Mocha",

	window_background_gradient = {
    orientation = { Linear = { angle = -45.0 } },
		colors = {
			"#020024",
			"#1c042f",
		},
	},
  window_background_opacity = 0.97,
	window_padding = {
		left = 30,
		right = 20,
		top = 30,
		bottom = 20,
	},
	-- general options
	adjust_window_size_when_changing_font_size = false,
	debug_key_events = false,
	enable_tab_bar = false,
	native_macos_fullscreen_mode = false,
	-- window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",

	-- keys
	keys = {
		k.cmd_key("[", act.SendKey({ mods = "CTRL", key = "o" })),
	},
}

return config

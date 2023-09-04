local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Dracula (Official)"

config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.5,
}

return config

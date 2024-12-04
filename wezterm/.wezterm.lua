-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Configure cursor appearance
config.default_cursor_style = 'BlinkingBar'

-- Apply your configuration and theme settings
config.color_scheme = 'Monokai Pro (Gogh)'
config.colors = {
    background = '#222222'
    }

-- config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.enable_tab_bar = false
config.window_decorations = "NONE"

config.font =
    wezterm.font{
        family = 'MonaspiceNe Nerd Font Mono',
        weight = 500,
        italic = false,
        harfbuzz_features =  {'calt', 'liga', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08', 'ss09'}
}

config.font_size = 12.5

config.disable_default_key_bindings = true

-- Define key bindings
config.keys = {
    -- Increase and decrease font size 
    {
        key='UpArrow',
        mods='CTRL',
        action=wezterm.action.IncreaseFontSize
    },
    {
        key='DownArrow',
        mods='CTRL',
        action=wezterm.action.DecreaseFontSize
    },
    {
        key='v',
        mods='CTRL',
        action=wezterm.action.PasteFrom('Clipboard')
    },

}
-- Remove confirmation on exit
config.window_close_confirmation = 'NeverPrompt'

launch_menu = {
    {
      label = "Neovim",
      args = {"nvim"},
      -- Override the window decorations for Neovim
      window_decorations = "NONE", -- Remove window borders
    },
  }

config.max_fps = 120

-- Return the configuration to wezterm
return config


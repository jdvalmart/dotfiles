local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Appearance - Gentleman theme colors
config.color_scheme = 'dark'
config.colors = {
  foreground = '#F3F6F9',
  background = '#06080f',
  cursor_bg = '#7AA89F',
  cursor_border = '#7AA89F',
  selection_bg = '#263356',
  selection_fg = '#F3F6F9',

  ansi = {
    black = '#191E28',
    red = '#CB7C94',
    green = '#B7CC85',
    yellow = '#FFE066',
    blue = '#7FB4CA',
    magenta = '#A3B5D6',
    cyan = '#7AA89F',
    white = '#F3F6F9',
  },

  indexed = {
    [16] = '#DEBA87',
    [17] = '#FF8DD7',
  },

  scrollbar_thumb = '#232A40',
  split = '#232A40',
}

-- Font - JetBrains Mono with Nerd Font
config.font = wezterm.font_with_fallback {
  'JetBrains Mono',
  'FiraCode Nerd Font',
  'Symbols Nerd Font Mono',
}
config.font_size = 11.0
config.line_height = 1.2

-- Tab bar
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false

config.tab_max_width = 32

-- Window
config.window_padding = {
  left = 8,
  right = 8,
  top = 8,
  bottom = 8,
}

config.window_decorations = "RESIZE"
config.window_close_confirmation = 'NeverPrompt'
config.adjust_window_size_when_changing_font_size = false

-- Performance
config.max_fps = 144
config.animation_fps = 60
config.cursor_blink_rate = 800
config.cursor_blink_ease_in = 'Constant'

-- Mouse
config.enable_scroll_bar = false
config.mouse_bindings = {
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = wezterm.action.CompleteSelection 'ClipboardAndPrimarySelection',
  },
}

-- Hyperlink rules
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- Default domain (WSL) + default working directory
config.default_domain = 'WSL:Ubuntu-24.04'
config.default_cwd = '/home/jdvalmart'

-- Key bindings
config.keys = {
  {key="Enter", mods="SHIFT", action=wezterm.action{SendString="\x1b\r"}},
}

-- Scrollback
config.scrollback_lines = 10000

return config
-- This file contains the configuration for disabling specific Neovim plugins.

return {
  -- Buffer/Tab plugins
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },

  -- AI Plugins
  -- opencode.nvim (principal) + copilot.lua (autocompletado) activos
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    enabled = false,
  },
  {
    "olimorris/codecompanion.nvim",
    enabled = false,
  },
  {
    "yetone/avante.nvim",
    enabled = false,
  },
  {
    "sphamba/smear-cursor.nvim",
    enabled = false,
  },
  {
    "coder/claudecode.nvim",
    enabled = false,
  },

  -- Themes (solo gentleman-kanagawa-blur)
  {
    "catppuccin/nvim",
    enabled = false,
  },
  {
    "rebelot/kanagawa.nvim",
    enabled = false,
  },
  {
    "folke/tokyonight.nvim",
    enabled = false,
  },
  {
    "Alan-TheGentleman/oldworld.nvim",
    enabled = false,
  },

  -- Other plugins
}

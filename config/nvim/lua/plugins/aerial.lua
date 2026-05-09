-- aerial.nvim - Navegador de symbols/outline
return {
  "stevearc/aerial.nvim",
  lazy = true,
  event = "LspAttach",
  opts = {
    -- Configuración básica
    backends = { "lsp", "treesitter" },
    show_symbols = true,
    -- Keymaps
    keymaps = {
      ["<leader>a"] = "actions.toggle",
      ["<leader>j"] = "actions.next",
      ["<leader>k"] = "actions.prev",
      ["<leader>o"] = "actions.scroll",
    },
  },
  keys = {
    { "<leader>ao", "<cmd>AerialToggle<CR>", desc = "Toggle Aerial (symbols)" },
  },
}
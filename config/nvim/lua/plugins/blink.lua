return {
  "saghen/blink.cmp",
  lazy = true,
  dependencies = { "saghen/blink.compat" },
  opts = {
    -- Autocompletado inteligente
    fuzzy = {
      enabled = true,
    },
    sources = {
      -- Sources prioritarios
      default = { "lsp", "path", "snippets", "buffer" },
    },
    -- Configuración de appearance
    appearance = {
      -- Menú de completados estilo VSCode
      use_nerd_fonts = false,
    },
    -- Configuración de completado
    completion = {
      -- Menú muestran con 8 items
      menu_size = 8,
      -- Documentation automáticamente
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
    },
  },
}

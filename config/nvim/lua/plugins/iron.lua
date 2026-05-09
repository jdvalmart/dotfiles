return {
  {
    "hkupty/iron.nvim",
    config = function()
      local iron = require("iron.core")

      iron.setup({
        config = {
          repl_definition = {
            python = {
              command = { "python3" },
            },
          },

          repl_open_cmd = "rightbelow 15split",
        },

        keymaps = {
          send_motion = "<leader>sc",
          send_line = "<leader>sl",
          visual_send = "<leader>sv", -- ✅ CLAVE CORRECTA
          send_file = "<leader>sf",
        },

        highlight = {
          italic = true,
        },

        ignore_blank_lines = true,
      })
    end,
  },
}

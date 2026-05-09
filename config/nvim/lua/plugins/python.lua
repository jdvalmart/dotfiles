return {
  -- LSP: solo configuramos pyright
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.pyright = {
        settings = {
          python = {
            venvPath = ".",
            venv = ".venv",
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
            },
          },
        },
      }
    end,
  },

  -- Formatter: Black
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "black" },
      },
    },
  },

  -- Linter: Ruff
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.python = { "ruff" }
    end,
  },
}

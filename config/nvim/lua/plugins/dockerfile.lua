-- Dockerfile LSP - Language Server para Dockerfiles
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      dockerls = {
        -- Dockerfile Language Server
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern("Dockerfile", ".dockerignore")(fname)
        end,
      },
    },
  },
}
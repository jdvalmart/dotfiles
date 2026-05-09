-- lazygit.nvim - UI de git flotante
return {
  "kdheepak/lazygit.nvim",
  keys = {
    {
      "<leader>gg",
      function()
        vim.cmd("LazyGit")
      end,
      desc = "Open LazyGit",
    },
  },
}
return {
  "benlubas/molten-nvim",
  build = ":UpdateRemotePlugins",
  config = function()
    vim.g.molten_output_win_max_height = 20
  end,
}

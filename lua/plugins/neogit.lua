return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed.
    "nvim-telescope/telescope.nvim", -- optional
    "ibhagwan/fzf-lua", -- optional
    "echasnovski/mini.pick", -- optional
  },
  config = true,
  keys = {
    {
      "<leader>gn",
      function()
        require("neogit").open({
          kind = "tab",
        })
      end,
      desc = "Neogit",
    },
  },
  opts = {
    -- HACK: temporal, related to #1691, should wait until neovim 0.12 release
    disable_signs = true,
  },
}

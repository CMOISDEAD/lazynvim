return {
  {
    "kylechui/nvim-surround",
    version = "^3.0.0",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
    opts = {},
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = false,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      ui = {
        enabled = false,
      },
      workspaces = {
        {
          name = "personal",
          path = "~/vaults/personal",
        },
      },
      notes_subdir = "notes",
      daily_notes = {
        folder = "notes/dailies",
        date_format = "%Y-%m-%d",
        alias_format = "%B %-d, %Y",
        default_tags = { "daily-notes" },
        template = nil,
      },
    },
  },
  {
    "vyfor/cord.nvim",
    build = ":Cord update",
    opts = {
      display = {
        theme = "catppuccin",
        flavor = "accent",
      },
    },
  },
  {
    "kyza0d/xeno.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("xeno").new_theme("my-theme", {
        base = "#1D1B16",
        accent = "#DFBFBB",
      })
      -- vim.cmd("colorscheme my-theme")
    end,
  },
}

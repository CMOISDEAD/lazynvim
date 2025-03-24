return {
  {
    "echasnovski/mini.files",
    keys = {
      {
        "<tab>",
        function()
          if not require("mini.files").close() then
            require("mini.files").open()
          end
        end,
      },
    },
  },

  {
    "mrjones2014/smart-splits.nvim",
    build = "./kitty/install-kittens.bash",
    opts = {
      function()
        local smartsplits = require("smart-splits")
        local map = vim.keymap.set

        map("n", "<C-w><Left>", smartsplits.resize_left)
        map("n", "<C-w><Rigth>", smartsplits.resize_right)
        map("n", "<C-w><Up>", smartsplits.resize_up)
        map("n", "<C-w><Down>", smartsplits.resize_down)

        map("n", "<C-h>", smartsplits.move_cursor_left)
        map("n", "<C-l>", smartsplits.move_cursor_right)
        map("n", "<C-k>", smartsplits.move_cursor_up)
        map("n", "<C-j>", smartsplits.move_cursor_down)

        map("n", "<C-S-h>", smartsplits.swap_buf_left)
        map("n", "<C-S-l>", smartsplits.swap_buf_right)
        map("n", "<C-S-k>", smartsplits.swap_buf_up)
        map("n", "<C-S-j>", smartsplits.swap_buf_down)
      end,
    },
  },
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
    config = function()
      require("hardtime").setup()
    end,
  },
  { "wakatime/vim-wakatime", lazy = false },
}

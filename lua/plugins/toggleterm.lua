return {
  "akinsho/toggleterm.nvim",
  lazy = false,
  version = "*",
  keys = {
    { "<leader>tf", "<cmd>ToggleTerm direction=float <CR>", desc = "Terminal Float" },
    { "<leader>tv", "<cmd>ToggleTerm direction=vertical size=60 <CR>", desc = "Terminal Vertical" },
    { "<leader>th", "<cmd>ToggleTerm direction=horizontal <CR>", desc = "Terminal Horizontal" },
    {
      "<leader>tl",
      function()
        local terminal = require("toggleterm.terminal").Terminal
        local lazygit = terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

        lazygit:toggle()
      end,
      desc = "Terminal Lazygit",
    },
    { "<C-'>", "<ESC><cmd>ToggleTerm<CR>", mode = "i" },
    { "<C-'>", '<cmd>execute v:count . "ToggleTerm"<CR>', mode = "n" },
    { "<C-'>", "<cmd>ToggleTerm<CR>", mode = "t" },
  },
  opts = {},
}

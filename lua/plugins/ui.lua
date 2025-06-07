return {
  {
    "folke/which-key.nvim",
    event = "VimEnter",
    opts = {
      preset = "helix",
      delay = 0,
      icons = {
        keys = {
          Up = "<Up> ",
          Down = "<Down> ",
          Left = "<Left> ",
          Right = "<Right> ",
          C = "<C-…> ",
          M = "<M-…> ",
          D = "<D-…> ",
          S = "<S-…> ",
          CR = "<CR> ",
          Esc = "<Esc> ",
          ScrollWheelDown = "<ScrollWheelDown> ",
          ScrollWheelUp = "<ScrollWheelUp> ",
          NL = "<NL> ",
          BS = "<BS> ",
          Space = "<Space> ",
          Tab = "<Tab> ",
          F1 = "<F1>",
          F2 = "<F2>",
          F3 = "<F3>",
          F4 = "<F4>",
          F5 = "<F5>",
          F6 = "<F6>",
          F7 = "<F7>",
          F8 = "<F8>",
          F9 = "<F9>",
          F10 = "<F10>",
          F11 = "<F11>",
          F12 = "<F12>",
        },
      },
    },
  },

  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })

      opts.presets.lsp_doc_border = true
    end,
  },

  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {},
    opts = {
      options = {
        mode = "tabs",
        -- separator_style = "slant",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },

  {
    "maxmx03/fluoromachine.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local fm = require("fluoromachine")
      fm.setup({
        glow = true,
        theme = "fluoromachine",
        transparent = false,
      })
    end,
  },

  {
    "EdenEast/nightfox.nvim",
    opts = {
      transparent = false,
      dim_inactive = false,
    },
  },

  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = {
      transparent_mode = false,
    },
  },

  {
    "craftzdog/solarized-osaka.nvim",
    opts = {
      transparent = true,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        sidebars = "dark",
        floats = "dark",
      },
    },
  },

  {
    "b0o/incline.nvim",
    dependencies = { "ellisonleao/gruvbox.nvim" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local colors = require("gruvbox").palette
      require("incline").setup({
        hide = { cursorline = false },
        window = { margin = { vertical = 0, horizontal = 1 } },
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.dark0_soft, guifg = colors.light0 },
            InclineNormalNC = { guifg = colors.bright_yellow, guibg = colors.dark0_soft },
          },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end
          if filename == "" then
            filename = "[No Name]"
          end
          local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)

          local function get_git_diff()
            local icons = { removed = "-", changed = "*", added = "+" }
            local signs = vim.b[props.buf].gitsigns_status_dict
            local labels = {}
            if signs == nil then
              return labels
            end
            for name, icon in pairs(icons) do
              if tonumber(signs[name]) and signs[name] > 0 then
                table.insert(labels, { icon .. signs[name] .. " ", group = "Diff" .. name })
              end
            end
            if #labels > 0 then
              table.insert(labels, { " " })
            end
            return labels
          end

          local function get_diagnostic_label()
            local icons = { error = "x", warn = "w", info = "i", hint = "h" }
            local label = {}

            for severity, icon in pairs(icons) do
              local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
              if n > 0 then
                table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
              end
            end
            if #label > 0 then
              table.insert(label, { " " })
            end
            return label
          end

          return {
            { get_diagnostic_label() },
            { get_git_diff() },
            { (ft_icon or "") .. " ", guifg = ft_color, guibg = "none" },
            { filename .. " ", gui = vim.bo[props.buf].modified and "bold,italic" or "bold" },
          }
        end,
      })
    end,
  },

  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
            :h-                                  Nhy`               
           -mh.                           h.    `Ndho               
           hmh+                          oNm.   oNdhh               
          `Nmhd`                        /NNmd  /NNhhd               
          -NNhhy                      `hMNmmm`+NNdhhh               
          .NNmhhs              ```....`..-:/./mNdhhh+               
           mNNdhhh-     `.-::///+++////++//:--.`-/sd`               
           oNNNdhhdo..://++//++++++/+++//++///++/-.`                
      y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       
 .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        
 h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         
 hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        
 /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       
  oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      
   /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     
     /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    
       .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    
       -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   
       /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   
       //+++//++++++////+++///::--                 .::::-------::   
       :/++++///////////++++//////.                -:/:----::../-   
       -/++++//++///+//////////////               .::::---:::-.+`   
       `////////////////////////////:.            --::-----...-/    
        -///://////////////////////::::-..      :-:-:-..-::.`.+`    
         :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -   
           ::::://::://::::::::::::::----------..-:....`.../- -+oo/ 
            -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``
           s-`::--:::------:////----:---.-:::...-.....`./:          
          yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           
         oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              
        :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                
                        .-:mNdhh:.......--::::-`                    
                           yNh/..------..`                          
          ]],
          keys = {},
        },
        sections = {
          { section = "header" },
          -- { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },

  {
    "mvllow/modes.nvim",
    config = function()
      require("modes").setup()
    end,
  },
}

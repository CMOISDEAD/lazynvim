local Snacks = require("snacks")

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  init = function()
    local copilot_exists = pcall(require, "copilot")
    if copilot_exists then
      Snacks.toggle({
        name = "Copilot Completion",
        color = {
          enabled = "azure",
          disabled = "orange",
        },
        get = function()
          return not require("copilot.client").is_disabled()
        end,
        set = function(state)
          if state then
            require("copilot.command").enable()
          else
            require("copilot.command").disable()
          end
        end,
      }):map("<leader>aT")
    end
  end,
}

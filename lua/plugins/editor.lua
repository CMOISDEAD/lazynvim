return {
  {
    "nvim-orgmode/orgmode",
    config = function()
      require("orgmode").setup({
        org_agenda_files = "~/org/**/*",
        org_default_notes_file = "~/org/refile.org",
        org_todo_keywords = { "(t) TODO", "|", "(d) DONE" },
        org_capture_templates = {
          t = {
            description = "Todo",
            template = "* TODO %?\n%U",
            target = "~/org/todo.org",
          },
          j = {
            description = "Journal",
            template = "\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?",
            target = "~/org/journal.org",
          },
          n = {
            description = "Notes",
            template = "* %?\n %u",
            target = "~/org/org-files/notes.org",
          },
        },
      })
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "^3.0.0",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
}

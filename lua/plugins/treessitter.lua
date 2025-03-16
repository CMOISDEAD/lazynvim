return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "astro",
        "cmake",
        "cpp",
        "css",
        "gitignore",
        "go",
        "graphql",
        "html",
        "http",
        "java",
        "php",
        "rust",
        "scss",
        "sql",
        "svelte",
        "javascript",
        "typescript",
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      vim.filetype.add({
        extension = {
          mdx = "mdx",
        },
      })

      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
}

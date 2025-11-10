return {
  {
    "folke/flash.nvim",
    enabled = false,
    keys = {
      -- disable the default flash keymap
      { "s", mode = { "n", "x", "o" }, false },
      { "S", mode = { "n", "x", "o" }, false },
    },
  },
  {
    "folke/noice.nvim",
    enabled = false,
    keys = {
      { "c-f", mode = { "n", "i", "s" }, false },
      { "c-b", mode = { "n", "i", "s" }, false },
    },
  },
  { "ggandor/leap.nvim", enabled = false },
  -- Disable LazyVim markdown extra plugins to keep original content
  { "MeanderingProgrammer/render-markdown.nvim", enabled = false },
  { "iamcco/markdown-preview.nvim", enabled = false },
  
  -- Disable specific LSP servers from markdown extra
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = false,
      },
    },
  },
  
  -- Disable conform formatters for markdown
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        markdown = {},
        ["markdown.mdx"] = {},
      },
    },
  },
  
  -- Disable nvim-lint for markdown
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = {},
      },
    },
  },
  
  -- Disable treesitter markdown concealing
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        disable = { "markdown", "markdown_inline" },
      },
    },
  }
}

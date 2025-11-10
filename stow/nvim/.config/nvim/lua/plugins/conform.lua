return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  opts = {
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      yaml = { "prettier" },
      graphql = { "prettier" },
      vue = { "prettier" },
      svelte = { "prettier" },
      markdown = { "prettier" },
      ["markdown.mdx"] = { "prettier" },
    },
    formatters = {
      prettier = {
        command = vim.fn.stdpath("data") .. "/mason/bin/prettier",
        prepend_args = { "--single-quote", "--trailing-comma", "es5" },
      },
    },
  },
}
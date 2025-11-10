return {
  {
    "nvim-telescope/telescope.nvim",
    enable = true,
    keys = {
      -- { "D-e", "<cmd>FzfLua oldfiles<cr>", desc = "Recent" },
      -- Override default gd to use built-in LSP instead of telescope
      { "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Go to Definition" },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { ".git/", "vendor/", "Alfred/" },
          -- Remove node_modules from ignore to allow definitions in dependencies
        },
        pickers = {
          find_files = {
            hidden = true,
            -- Show hidden files and directories like .config
          },
        },
      })
    end,
  },
}

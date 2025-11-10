return {
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "Cargo.toml", "go.mod" },
        ignore_lsp = { "efm", "sumneko_lua" },
        silent_chdir = true,
        -- require("telescope").load_extension("projects"),
      })
    end,
  },
}

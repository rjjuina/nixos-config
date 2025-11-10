return {
  -- Override Mason-managed LSPs to use system packages
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      handlers = {
        -- Disable nil_ls installation, we'll use system nixd
        nil_ls = function() end,
        -- Disable ts_ls installation to prevent conflicts with vtsls
        ts_ls = function() end,
      },
    },
  },

  -- Configure nixd LSP directly
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Disable nil_ls
        nil_ls = false,
        -- Disable ts_ls in favor of vtsls (LazyVim default for TypeScript)
        ts_ls = false,
        -- Configure nixd
        nixd = {
          cmd = { "nixd" },
          settings = {
            nixd = {
              nixpkgs = {
                expr = "import <nixpkgs> { }",
              },
              formatting = {
                command = { "nixfmt" },
              },
            },
          },
        },
      },
      -- Set default position encoding for all LSP servers
      capabilities = {
        offsetEncoding = { "utf-16" },
      },
    },
  },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. This import is now handled in lazy.lua

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      indent = {
        enable = true,
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
      },
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "nix",
        "go",
        "java",
        "toml",
      },
    },
  },

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
      })
    end,
  },
}

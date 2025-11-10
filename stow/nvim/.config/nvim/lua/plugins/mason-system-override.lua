-- Override Mason installations for system-provided tools
return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Remove any Nix-related tools from auto-installation
        -- Add other tools you want Mason to manage
        "stylua",
        "shfmt",
        "prettier",
      },
    },
  },
  
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      -- Don't auto-install these LSPs, use system versions
      handlers = {
        nil_ls = function() end, -- Disable nil_ls installation
        nixd = function() end,   -- Disable nixd installation (use system)
      },
    },
  },

  -- Ensure conform.nvim uses system nixfmt
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        nixfmt = {
          command = "nixfmt", -- Use system nixfmt
        },
      },
    },
  },
}
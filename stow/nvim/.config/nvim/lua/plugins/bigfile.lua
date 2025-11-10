-- Override snacks.nvim bigfile detection
return {
  {
    "folke/snacks.nvim",
    opts = {
      bigfile = {
        enabled = true,
        notify = true,
        size = 1024 * 1024 * 50, -- 50MB (instead of default ~1.5MB)
        line_length = 10000000, -- Allow very long lines (default is 1000)
      },
    },
  },
}


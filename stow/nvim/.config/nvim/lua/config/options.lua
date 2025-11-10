-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Increase big file limits (default is 1.5MB)
vim.g.bigfile_size = 1024 * 1024 * 10 -- 10MB for file size

-- Disable bigfile detection for specific patterns or increase limits
vim.g.lazyvim_bigfile = {
  size = 1024 * 1024 * 50,  -- 50MB file size limit
  lines = 50000,             -- 50k lines limit
  modeline = false,
  -- Disable bigfile detection completely for JSON files
  disable = function(buf)
    local ft = vim.bo[buf].filetype
    return ft == "json" or ft == "jsonc"
  end,
}

require "nvchad.options"

local opt = vim.opt

opt.relativenumber = true
opt.scrolloff = 8
opt.colorcolumn = "80"

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go" },
  callback = function()
    vim.opt_local.colorcolumn = "100"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "svelte", "javascript", "typescript" },
  callback = function()
    vim.opt_local.colorcolumn = "80,120"
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "ColorColumn", {
      bg = "#374151",
    })
  end,
})

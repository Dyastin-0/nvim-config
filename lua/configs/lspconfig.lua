require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "gopls", "svelte", "ts_ls" }
local nvlsp = require "nvchad.configs.lspconfig"

vim.diagnostic.config({
  virtual_text = false,
  float = {
    wrap = true,
    border = "rounded",
    max_width = math.floor(vim.o.columns * 0.6),
    focusable = false,
    close_events = { "BufLeave", "CursorMoved", "InsertEnter" },
  },
  signs = true,
  underline = true,
  severity_sort = true,
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = "rounded",
      source = "always",
      prefix = " ",
      scope = "cursor",
    }
    vim.diagnostic.open_float(nil, opts)
  end
})

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.gopls.setup {
  on_attach = function(client, bufnr)
    nvlsp.on_attach(client, bufnr)
  end,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        nilness = true,
        shadow = true,
        unusedwrite = true,
      },
      staticcheck = true,
    },
  },
}

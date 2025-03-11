local options = {
    formatters = {
        prettier = {
            command = '"C:/Users/Justine/AppData/Roaming/npm/prettier.cmd"',
        },
    },      
    formatters_by_ft = {
      lua = { "stylua" },
      go = { "gofumpt", "goimports" },
      svelte = { "prettier" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
    },
  
    -- Enable format on save
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  }
  
  return options
  
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

vim.cmd([[packadd cmp-nvim-lsp]])
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = {
  sumneko_lua = require("lsp.config.lua"),
  jsonls = require("lsp.config.json"),
  volar = require("lsp.config.volar"),
  cssls = {},
  eslint = {},
  html = {},
  tailwindcss = {},
  pyright = {}
}

mason.setup {}
mason_lspconfig.setup {
  ensure_installed = {"sumneko_lua", "cssls", "eslint", "html", "jsonls", "tailwindcss", "volar", "emmet_ls", "pyright"}
}

for name, config in pairs(servers) do
  config.capabilities = capabilities
  lspconfig[name].setup(config)
end

local signs = {
  Error = " ",
  Warn = " ",
  Info = " ",
  Hint = " "
}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

vim.diagnostic.config(
  {
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    virtual_text = {
      source = true,
      prefix = '🔥',
    }
  }
)

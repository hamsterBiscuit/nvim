local lsp_installer = require("nvim-lsp-installer")

local servers = {
  sumneko_lua = require("lsp.config.lua"),
  cssls = require("lsp.config.cssls"),
  -- diagnosticls = require("lsp.config.diagnosticls"),
  -- eslint = require("lsp.config.eslint"),
  -- html = require("lsp.config.html"),
  -- jsonls = require("lsp.config.json"),
  -- tsserver = require("lsp.config.tsserver"),
  -- tailwindcss = require("lsp.config.tailwindcss"),
  -- valar = require('lsp.config.valar')
}

for name, _ in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing" .. name)
      server:install()
    end
  end
end

lsp_installer.on_server_ready(function(server)
  local config = servers[server.name]
  if config == nil then
    return
  end
  if config.on_setup then
    config.on_setup(server)
  else
    server:setup({})
  end
end)

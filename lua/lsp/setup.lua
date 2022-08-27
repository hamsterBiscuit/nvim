
local mason = require("mason")
local mason_registry = require("mason-registry")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local servers = {
  sumneko_lua = require("lsp.config.lua"),
  cssls = require("lsp.config.cssls"),
  eslint = {},
  html = require("lsp.config.html"),
  jsonls = require("lsp.config.json"),
  tailwindcss = {},
  volar = require("lsp.config.volar"),
  emmet_ls = {},
}

mason.setup()
mason_lspconfig.setup()

mason_lspconfig.setup_handlers {
  function(serner_name)
    lspconfig[server_name].setup {}
  end,
  ["sumneko_lua"] = function()
    lspconfig.sumneko_lua.setup(servers.sumneko_lua)
  end,
  ["cssls"] = function()
    servers.cssls.capabilities = capabilities
    lspconfig.cssls.setup(servers.cssls)
  end,
  ["html"] = function()
    servers.html.capabilities = capabilities
    lspconfig.html.setup(servers.html)
  end,
  ["jsonls"] = function()
    lspconfig.json.setup(servers.json)
  end,
  ["tailwindcss"] = function()
    servers.tailwindcss.capabilities = capabilities
    lspconfig.tailwindcss.setup(servers.tailwindcss)
  end,
  ["volar"] = function()
    servers.volar.capabilities = capabilities
    lspconfig.volar.setup(servers.volar)
  end,
}
-- local lsp_installer = require("nvim-lsp-installer")
--
--
-- for name, _ in pairs(servers) do
--   local server_is_found, server = lsp_installer.get_server(name)
--   if server_is_found then
--     if not server:is_installed() then
--       vim.notify("Install Language Server : " .. name, "WARN", {title = "Language Servers"})
--       server:install()
--     end
--   end
-- end
--
--
-- lsp_installer.on_server_ready(
--   function(server)
--     local config = servers[server.name]
--     if config == nil then
--       return
--     end
--     if config.opts then
--       config.opts.capabilities = capabilities
--       config.opts.root_dir = function()
--         return vim.fn.getcwd()
--       end
--       server:setup(config.opts)
--     else
--       server:setup({
--         root_dir = function()
--           return vim.fn.getcwd()
--         end,
--         capabilities = capabilities
--       })
--     end
--   end
-- )

-- 诊断样式定制
vim.diagnostic.config(
  {
    -- 诊断的虚拟文本
    virtual_text = {
      -- 显示的前缀，可选项：'●', '▎', 'x'
      -- 默认是一个小方块，不是很好看，所以这里改了
      prefix = "●",
      -- 是否总是显示前缀？是的
      source = "always"
    },
    float = {
      -- 是否显示诊断来源？是的
      source = "always"
    },
    -- 在插入模式下是否显示诊断？不要
    update_in_insert = true
  }
)


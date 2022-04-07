local lsp_installer = require("nvim-lsp-installer")

local servers = {
  sumneko_lua = require("lsp.config.lua"),
  cssls = require("lsp.config.cssls"),
  eslint = {},
  html = require("lsp.config.html"),
  jsonls = require("lsp.config.json"),
  tsserver = {},
  tailwindcss = {},
  volar = require("lsp.config.volar")
}

for name, _ in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      vim.notify("Install Language Server : " .. name, "WARN", {title = "Language Servers"})
      server:install()
    end
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

lsp_installer.on_server_ready(
  function(server)
    local config = servers[server.name]
    if config == nil then
      return
    end
    if config.opts then
      config.opts.capabilities = capabilities
      config.opts.root_dir = function()
        return vim.fn.getcwd()
      end
      server:setup(config.opts)
    else
      server:setup({
        root_dir = function()
          return vim.fn.getcwd()
        end,
        capabilities = capabilities
      })
    end
  end
)

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


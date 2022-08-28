local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local servers = {
  sumneko_lua = require("lsp.config.lua"),
  jsonls = require("lsp.config.json"),
  volar = require("lsp.config.volar"),
}

mason.setup {}
mason_lspconfig.setup {
  ensure_installed = { "sumneko_lua", "cssls", "eslint", "html", "jsonls", "tailwindcss", "volar", "emmet_ls" }
}

for name, config in pairs(servers) do
  lspconfig[name].setup(config)
end

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

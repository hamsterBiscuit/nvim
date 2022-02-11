local config = {}

-- lsp
function config:configLSP()
  vim.cmd [[packadd lspsaga.nvim]]
  local saga = require "lspsaga"
  saga.setup {}
  local util = require("lspconfig/util")

  local servers = {
    "jsonls",
    "clangd",
    "pyright",
    "vimls",
    "html",
    "cssls",
    "phpactor",
    "tailwindcss"
  }

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  for _, server in ipairs(servers) do
    require("lspconfig")[server].setup {
      capabilities = capabilities
    }
  end

  -- require("lspconfig").vuels.setup {
  --   capabilities = capabilities,
  --   init_options = {
  --     config = {
  --       vetur = {
  --         ignoreProjectWarning = true
  --       }
  --     }
  --   }
  -- }
  require "lspconfig".volar.setup {
    capabilities = capabilities
  }

  require "lspconfig".tsserver.setup {
    capabilities = capabilities,
    root_dir = function(fname)
      return util.root_pattern("tsconfig.json")(fname) or
        util.root_pattern("package.json", "jsconfig.json", ".git")(fname) or
        util.path.dirname(fname)
    end
  }
  require "lspconfig".gopls.setup {
    capabilities = capabilities,
    cmd = {"gopls"},
    filetypes = {"go", "gomod"},
    root_dir = function(fname)
      return util.root_pattern("go.mod", ".git")(fname) or util.path.dirname(fname)
    end,
    settings = {
      gopls = {
        analyses = {
          unusedparams = true
        },
        staticcheck = true
      }
    }
  }
  local sumneko_root_path = os.getenv("HOME") .. "/develop/lua-language-server"
  local runtime_path = vim.split(package.path, ";")
  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")

  require("lspconfig").sumneko_lua.setup {
    -- capabilities = capabilities,
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
          -- Setup your lua path
          path = runtime_path
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {"vim"}
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true)
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false
        }
      }
    }
  }

  require("lspconfig").diagnosticls.setup {
    filetypes = {"javascript", "javascript.jsx", "typescript", "typescriptreact", "vue"},
    init_options = {
      filetypes = {
        javascript = "eslint",
        ["javascript.jsx"] = "eslint",
        javascriptreact = "eslint",
        typescriptreact = "eslint",
        typescript = "eslint",
        vue = "eslint"
      },
      linters = {
        eslint = {
          sourceName = "eslint",
          command = "./node_modules/.bin/eslint",
          rootPatterns = {".git"},
          debounce = 100,
          args = {
            "--cache",
            "--stdin",
            "--stdin-filename",
            "%filepath",
            "--format",
            "json"
          },
          parseJson = {
            errorsRoot = "[0].messages",
            line = "line",
            column = "column",
            endLine = "endLine",
            endColumn = "endColumn",
            message = "${message} [${ruleId}]",
            security = "severity"
          },
          securities = {
            [2] = "error",
            [1] = "warning"
          }
        }
      }
    }
  }
end

config:configLSP()

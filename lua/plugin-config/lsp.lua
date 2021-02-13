local config = {}

-- lsp
function config:configLSP()
  local util = require("lspconfig/util")

  local servers = {
    "jsonls",
    "clangd",
    "pyright",
    "vimls",
    "vuels",
    "html",
    "cssls"
  }

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  for _, server in ipairs(servers) do
    require("lspconfig")[server].setup {
      capabilities = capabilities
    }
  end

  require("lspconfig").vuels.setup {
    capabilities = capabilities,
    init_options = {
      config = {
        vetur = {
          ignoreProjectWarning = true
        }
      }
    }
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

  require("lspconfig").sumneko_lua.setup {
    -- capabilities = capabilities,
    cmd = {sumneko_root_path .. "/bin/macOS/lua-language-server", "-E", sumneko_root_path .. "/main.lua"},
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
          -- Setup your lua path
          path = vim.split(package.path, ";")
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {"vim"}
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
          }
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

  -- vim.g.completion_enable_snippet = "vim-vsnip"
  -- vim.g.completion_confirm_key = "<C-y>"
  -- vim.g.completion_enable_auto_hover = 0
  -- vim.g.completion_matching_smart_case = 1
  -- vim.g.completion_trigger_on_delete = 1
  -- vim.g.completion_auto_change_source = 1
  -- vim.g.completion_chain_complete_list = {
  --   default = {
  --     {complete_items = {"lsp", "tabnine", "snippet", "path"}},
  --     {mode = {"<c-p>"}},
  --     {mode = {"<c-n>"}}
  --   }
  -- }
  --
  -- vim.g.completion_word_ignored_ft = {"LuaTree", "vista"}
end

-- vim.api.nvim_command([[sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError linehl= numhl=]])
-- vim.api.nvim_command([[sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning linehl= numhl=]])
-- vim.api.nvim_command(
--   [[sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl= numhl=]]
-- )
-- vim.api.nvim_command([[sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=]])
-- -- show hover window on hover
-- vim.cmd [[ autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics() ]]
-- vim.lsp.handlers["textDocument/publishDiagnostics"] =
--   vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics,
--   {
--     -- Enable underline, use default values
--     underline = true,
--     -- Enable virtual text, override spacing to 4
--     virtual_text = false,
--     -- Disable a feature
--     update_in_insert = true,
--     signs = {
--       enable = true,
--       priority = 20
--     }
--   }
-- )
--
config:configLSP()

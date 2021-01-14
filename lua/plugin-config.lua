
local config = {}

-- lsp
function config:configLSP()
  local on_attach = function(_, bufnr)
    require('completion').on_attach()
  end

  local servers = {'tsserver', 'jsonls', 'clangd', 'cssls', 'html', 'jdtls', 'pyright', 'ocamllsp', 'hls', 'vimls', 'vuels', 'gopls'}

  for _, server in ipairs(servers) do
    require('lspconfig')[server].setup {
      on_attach = on_attach,
    }
  end

  local sumneko_root_path = os.getenv("HOME") .. '/develop/lua-language-server'

  require('lspconfig').sumneko_lua.setup {
    cmd = { sumneko_root_path .. '/bin/macOS/lua-language-server', '-E', sumneko_root_path .. '/main.lua' };
    filetypes = {'lua'};
    root_patterns = {'.git'};
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          -- path = vim.split(package.path, ';'),
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          },
        },
      },
    },
  }
  vim.g.completion_enable_snippet = 'vim-vsnip'
  vim.g.completion_confirm_key = ''
  vim.g.completion_enable_auto_hover = 0
  vim.g.completion_matching_smart_case = 1
  vim.g.completion_trigger_on_delete = 1
  vim.g.completion_chain_complete_list = {
    { complete_items = { 'lsp' } },
    { complete_items = { 'snippet' } },
    { complete_items = { 'buffers' } },
    { complete_items = { 'path' } },
    { mode = { '<c-p>' } },
    { mode = { '<c-n>' } }
  }
  vim.api.nvim_set_keymap('i', '<CR>', [[pumvisible() ? complete_info()["selected"] != "-1" ?"\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>":(delimitMate#WithinEmptyPair() ? "\<Plug>delimitMateCR" : "\<CR>")]], { expr = true })

  vim.g.completion_word_ignored_ft = {'LuaTree','vista'}
end


vim.api.nvim_command([[sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError linehl= numhl=]])
vim.api.nvim_command([[sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning linehl= numhl=]])
vim.api.nvim_command([[sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl= numhl=]])
vim.api.nvim_command([[sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=]])

config:configLSP()


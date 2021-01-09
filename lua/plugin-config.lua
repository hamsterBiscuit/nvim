

local config = {}

-- lsp
function config:configLSP()
  local on_attach = function(_, bufnr)
    require('completion').on_attach()
  end
  vim.api.nvim_command([[command! Format execute 'lua vim.lsp.buf.formatting()']])

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
  vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
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

--  akinsho/nvim-bufferline.lua
function config:configBufferline()
  require'bufferline'.setup {
    options = {
      mappings = true,
      always_show_bufferline = false,
    }
  }
end

--  高亮
function config:configTreesitter()
  vim.api.nvim_command('set foldmethod=expr')
  vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
    },
  }
end

function config:configIndentGuides()
  require('indent_guides').setup{
    exclude_filetypes = {'help','dashboard','dashpreview','LuaTree','vista','sagahover'};
  }
end

-- 括号
function config:configDelimitMate()
  vim.g.delimitMate_expand_cr = 0
  vim.g.delimitMate_expand_space = 1
  vim.g.delimitMate_smart_quotes = 1
  vim.g.delimitMate_expand_inside_quotes = 0
  vim.api.nvim_command('au FileType markdown let b:delimitMate_nesting_quotes = ["`"]')
end

-- git
function config:configSignify()
  vim.g.signify_sign_add = '▋'
  vim.g.signify_sign_change = '▋'
  vim.g.signify_sign_delete = '▋'
  vim.g.signify_sign_delete_first_line = '▘'
  vim.g.signify_sign_show_count = 0
end

-- itchyny/vim-cursorword
function config:configCursorword()
  vim.api.nvim_command('augroup user_plugin_cursorword')
  vim.api.nvim_command('autocmd!')
  vim.api.nvim_command('autocmd FileType defx,denite,fern,clap,vista let b:cursorword = 0')
  vim.api.nvim_command('autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif')
  vim.api.nvim_command('autocmd InsertEnter * let b:cursorword = 0')
  vim.api.nvim_command('autocmd InsertLeave * let b:cursorword = 1')
  vim.api.nvim_command('augroup END')
end

-- glepnir/dashboard-nvim
function config:configDashboard()
  vim.g.dashboard_default_header = 'commicgirl10'
  vim.g.dashboard_default_executive ='telescope'
  vim.g.dashboard_custom_section = {
    find_history = {
      description = {'  Recently opened files                   SPC f h'},
      command = 'DashboardFindHistory'
    },
    find_file = {
      description = {'  Find  File                              SPC f f'},
      command = 'DashboardFindFile'
    },
    new_file = {
      description= {'  New   File                              SPC t f'},
      command= 'DashboardNewFile'
    },
    find_word = {
      description= {'  Find  word                              SPC f w'},
      command= 'DashboardFindWord'
    },
  }
end

-- nvim-tree.lua
function config:configNvimTree()
  vim.g.nvim_tree_hide_dotfiles = 1
  vim.g.nvim_tree_indent_markers = 1
  vim.g.nvim_tree_bindings = {
    edit =            {'<CR>', 'l'},
    edit_vsplit=     's',
    edit_split=      'i',
  }
  vim.g.nvim_tree_icons = {
    default= '',
    symlink= '',
    git= {
      unstaged= "✚",
      staged= "✚",
      unmerged= "≠",
      renamed= "≫",
      untracked= "★"
    },
  }
end

-- liuchengxu/vista.vim
function config:configVista()
  vim.g.vista_disable_statusline = 1
  vim.g.vista_default_executive = 'ctags'
  vim.g.vista_echo_cursor_strategy = 'scroll'
  vim.g.vista_vimwiki_executive = 'markdown'
  vim.g.vista_executive_for = {
    vimwiki= 'markdown',
    pandoc= 'markdown',
    markdown= 'vim_lsp',
    typescript= 'vim_lsp',
    typescriptreact= 'vim_lsp',
    vue= 'vim_lsp',
  }
end

-- ludovicchabant/vim-gutentags
function config:configGutentags()
  vim.g.gutentags_cache_dir = os.getenv("HOME") .. '/.cache/vim/tags'
  vim.g.gutentags_project_root = {'.root', '.git', '.svn','.project','go.mod','.Cargo.toml','tsconfig.js','jsconfig.js'}
  vim.g.gutentags_generate_on_write = 0
  vim.g.gutentags_generate_on_missing = 0
  vim.g.gutentags_generate_on_new = 0
  vim.g.gutentags_exclude_filetypes = { 'defx', 'denite', 'vista', 'magit' }
end

-- telescope
function config:configTelescope()
  require('telescope').setup {
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      }
    }
  }
  require('telescope').load_extension('fzy_native')
end

config:configBufferline()

require('eviline')

config:configDashboard()

config:configIndentGuides()

config:configCursorword()

require'colorizer'.setup{}

config:configNvimTree()

config:configTelescope()

require('zephyr')

config:configTreesitter()

config:configLSP()

config:configSignify()

config:configDelimitMate()

config:configGutentags()

config:configVista()

lspconf = require('lspconfig')

function root_pattern_prefer(...)
  local patterns = vim.tbl_flatten {...}
  return function(startpath)
    for _, pattern in ipairs(patterns) do
      path = lspconf.util.root_pattern(pattern)(startpath)
      if path then return path end
    end
  end
end

-- lsp
local on_attach = function(_, bufnr)
  require('completion').on_attach()
end

vim.api.nvim_command([[command! Format execute 'lua vim.lsp.buf.formatting()']])

local servers = {'jsonls', 'clangd', 'cssls', 'html', 'jdtls', 'pyright', 'ocamllsp', 'hls', 'vimls', 'vuels', 'gopls'}

for _, server in ipairs(servers) do
  lspconf[server].setup {
    on_attach = on_attach,
  }
end

lspconf['tsserver'].setup {
  on_attach = on_attach,
  root_dir = root_pattern_prefer("tsconfig.json", "package.json", ".git")
}

local sumneko_root_path = os.getenv("HOME") .. '/develop/lua-language-server'

lspconf.sumneko_lua.setup {
 cmd = { sumneko_root_path .. '/bin/macOS/lua-language-server', '-E', sumneko_root_path .. '/main.lua' };
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
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

--  akinsho/nvim-bufferline.lua
require'bufferline'.setup {
  options = {
    mappings = true,
    always_show_bufferline = false,
  }
}

require('eviline')

--  颜色荧光笔
require'colorizer'.setup{}

--  高亮
require('zephyr')
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

require('indent_guides').setup{
  exclude_filetypes = {'help','dashboard','dashpreview','LuaTree','vista','sagahover'};
}

-- 括号
vim.g.delimitMate_expand_cr = 0
vim.g.delimitMate_expand_space = 1
vim.g.delimitMate_smart_quotes = 1
vim.g.delimitMate_expand_inside_quotes = 0
vim.api.nvim_command('au FileType markdown let b:delimitMate_nesting_quotes = ["`"]')

-- git
vim.g.signify_sign_add = '▋'
vim.g.signify_sign_change = '▋'
vim.g.signify_sign_delete = '▋'
vim.g.signify_sign_delete_first_line = '▘'
-- vim.g.signify_sign_show_count = 0

-- itchyny/vim-cursorword
vim.api.nvim_command('augroup user_plugin_cursorword')
vim.api.nvim_command('autocmd!')
vim.api.nvim_command('autocmd FileType defx,denite,fern,clap,vista let b:cursorword = 0')
vim.api.nvim_command('autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif')
vim.api.nvim_command('autocmd InsertEnter * let b:cursorword = 0')
vim.api.nvim_command('autocmd InsertLeave * let b:cursorword = 1')
vim.api.nvim_command('augroup END')

-- glepnir/dashboard-nvim
vim.g.dashboard_default_header = 'commicgirl10'
vim.g.dashboard_default_executive ='clap'
vim.g.dashboard_custom_section = {
  find_history  = {
  description = {'  Recently opened files                   SPC f h'},
  command= 'DashboardFindHistory'},
  find_file           ={
    description= {'  Find  File                              SPC f f'},
    command= 'DashboardFindFile'},
    new_file            ={
      description= {'  New   File                              SPC t f'},
      command= 'DashboardNewFile'},
      find_word           ={
        description= {'  Find  word                              SPC f w'},
        command= 'DashboardFindWord'},
}

-- itchyny/vim-cursorword
vim.api.nvim_command('augroup user_plugin_cursorword')
vim.api.nvim_command('autocmd!')
vim.api.nvim_command('autocmd FileType defx,denite,fern,clap,vista let b:cursorword = 0')
vim.api.nvim_command('autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif')
vim.api.nvim_command('autocmd InsertEnter * let b:cursorword = 0')
vim.api.nvim_command('autocmd InsertLeave * let b:cursorword = 1')
vim.api.nvim_command('augroup END')

-- nvim-tree.lua
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

-- liuchengxu/vista.vim
vim.g['vista#renderer#enable_icon'] = 1
vim.g.vista_disable_statusline = 1
vim.g.vista_default_executive = 'ctags'
vim.g.vista_echo_cursor_strategy = 'scroll'
vim.g.vista_vimwiki_executive = 'markdown'
vim.g.vista_executive_for = {
  vimwiki= 'markdown',
  pandoc= 'markdown',
  markdown= 'lsp',
  typescript= 'lsp',
  typescriptreact= 'lsp',
  vue= 'lsp',
   }

-- ludovicchabant/vim-gutentags
vim.g.gutentags_cache_dir = '~/.cache/vim/tags'
vim.g.gutentags_project_root = {'.root', '.git', '.svn','.project','go.mod','.Cargo.toml','tsconfig.js','jsconfig.js'}
vim.g.gutentags_generate_on_write = 0
vim.g.gutentags_generate_on_missing = 0
vim.g.gutentags_generate_on_new = 0
vim.g.gutentags_exclude_filetypes = { 'defx', 'denite', 'vista', 'magit' }

-- clap
vim.g.clap_theme = 'material_design_dark'
vim.g.clap_current_selection_sign= { text = '➤', texthl= "ClapCurrentSelectionSign", linehl= "ClapCurrentSelection"}
vim.g.clap_layout = { relative = 'editor' }
vim.g.clap_enable_icon = 1
vim.g.clap_search_box_border_style = 'curve'
vim.g.clap_provider_grep_enable_icon = 1
vim.g.clap_prompt_format = '%spinner%%forerunner_status% %provider_id%: '

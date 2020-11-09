
lua << EOF
--  akinsho/nvim-bufferline.lua
require'bufferline'.setup{
  options = {
    mappings = true,
    always_show_bufferline = false,
  }
}

--  颜色荧光笔
require "colorizer".setup()

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

--  nvim-lua/completion-nvim
local on_attach_vim = function(client)
  require'completion'.on_attach(client)
  require'diagnostic'.on_attach(client)
end
require'nvim_lsp'.vuels.setup{on_attach=on_attach_vim}

EOF

" glepnir/dashboard-nvim
let g:dashboard_default_header = 'commicgirl10'
let g:dashboard_default_executive ='telescope'
let g:dashboard_custom_section = {
      \ 'find_history'        :{
          \ 'description': ['  Recently opened files                   SPC f h'],
          \ 'command': 'DashboardFindHistory'},
      \ 'find_file'           :{
          \ 'description': ['  Find  File                              SPC f f'],
          \ 'command': 'DashboardFindFile'},
      \ 'new_file'            :{
          \ 'description': ['  New   File                              SPC t f'],
          \ 'command': 'DashboardNewFile'},
      \ 'find_word'           :{
          \ 'description': ['  Find  word                              SPC f w'],
          \ 'command': 'DashboardFindWord'},
      \}

" itchyny/vim-cursorword
augroup user_plugin_cursorword
    autocmd!
    autocmd FileType defx,denite,fern,clap,vista let b:cursorword = 0
    autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif
    autocmd InsertEnter * let b:cursorword = 0
    autocmd InsertLeave * let b:cursorword = 1
augroup END

" defx
call utils#source_file($VIM_PATH,'module/defx.vim')

" mhinz/vim-signify
let g:signify_sign_add = '▋'
let g:signify_sign_change = '▋'
let g:signify_sign_delete = '▋'
let g:signify_sign_delete_first_line = '▘'
let g:signify_sign_show_count = 0

" Yggdroot/indentLine
let g:indentLine_enabled = 1
let g:indentLine_char='┆'
let g:indentLine_fileTypeExclude = ['defx','dbui','vista_kind','vista','dashboard']
let g:indentLine_concealcursor = 'niv'
let g:indentLine_showFirstIndentLevel =1

" liuchengxu/vista.vim
let g:vista#renderer#enable_icon = 1
let g:vista_disable_statusline = 1
let g:vista_default_executive = 'ctags'
let g:vista_echo_cursor_strategy = 'scroll'
let g:vista_vimwiki_executive = 'markdown'
let g:vista_executive_for = {
  \ 'vimwiki': 'markdown',
  \ 'pandoc': 'markdown',
  \ 'markdown': 'toc',
  \ 'typescript': 'nvim_lsp',
  \ 'typescriptreact': 'nvim_lsp',
  \ 'vue': 'nvim_lsp',
  \ }

" ludovicchabant/vim-gutentags
let g:gutentags_cache_dir = getenv("HOME").'/.cache/vim/tags'
let g:gutentags_project_root = ['.root', '.git', '.svn','.project','go.mod','.Cargo.toml','tsconfig.js','jsconfig.js']
let g:gutentags_generate_on_write = 0
let g:gutentags_generate_on_missing = 0
let g:gutentags_generate_on_new = 0
let g:gutentags_exclude_filetypes = [ 'defx', 'denite', 'vista', 'magit' ]

let g:prettier#autoformat = 0
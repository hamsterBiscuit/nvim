
lua << EOF
--  akinsho/nvim-bufferline.lua
require'bufferline'.setup{
  options = {
    mappings = true,
    always_show_bufferline = false,
  }
}

require('eviline')

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

require('indent_guides').options.exclude_filetypes = {'defx', 'dashboard', 'vista'}
require('indent_guides').options.indent_guide_size = 1
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

" Yggdroot/indentLine
let g:indentLine_enabled = 1
" let g:indentLine_char='┆'
let g:indentLine_fileTypeExclude = ['defx','dbui','vista_kind','vista','dashboard']
" let g:indentLine_concealcursor = 'niv'
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
  \ 'typescript': 'coc',
  \ 'typescriptreact': 'coc',
  \ 'vue': 'coc',
  \ }

" ludovicchabant/vim-gutentags
let g:gutentags_cache_dir = getenv("HOME").'/.cache/vim/tags'
let g:gutentags_project_root = ['.root', '.git', '.svn','.project','go.mod','.Cargo.toml','tsconfig.js','jsconfig.js']
let g:gutentags_generate_on_write = 0
let g:gutentags_generate_on_missing = 0
let g:gutentags_generate_on_new = 0
let g:gutentags_exclude_filetypes = [ 'defx', 'denite', 'vista', 'magit' ]

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
augroup mygroup
  autocmd!
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Add ':Prettier' command to format js
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'
let g:coc_status_error_sign = '•'
let g:coc_status_warning_sign = '•'
let g:coc_disable_transparent_cursor = 1
let g:coc_global_extensions =[
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-vimlsp',
    \ 'coc-snippets',
    \ 'coc-emmet',
    \ 'coc-pairs',
    \ 'coc-json',
    \ 'coc-highlight',
    \ 'coc-git',
    \ 'coc-emoji',
    \ 'coc-yaml',
    \ 'coc-tabnine',
    \ 'coc-gitignore',
    \ 'coc-actions',
    \ 'coc-spell-checker',
    \ 'coc-vetur',
    \ 'coc-tsserver',
    \ 'coc-eslint',
    \ 'coc-phpls',
    \ 'coc-sh',
    \ 'coc-prettier',
    \]


lua << EOF
--  颜色荧光笔
require "colorizer".setup()
EOF

colorscheme oceanic_material

" glepnir/dashboard-nvim
let g:dashboard_default_header = 'commicgirl10'
let g:dashboard_default_executive ='clap'
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

" glepnir/spaceline.vim
let g:spaceline_seperate_style= 'slant-cons'
let g:spaceline_git_branch_icon= ''

" indentLine
let g:indentLine_enabled = 1
let g:indentLine_char='┆'
let g:indentLine_fileTypeExclude = ['defx', 'denite', 'dashboard', 'tagbar', 'vista_kind', 'vista']
let g:indentLine_concealcursor = 'niv'
let g:indentLine_showFirstIndentLevel =1

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

" clap
let g:clap_theme = 'material_design_dark'
let g:clap_current_selection_sign= { 'text': '➤', 'texthl': "ClapCurrentSelectionSign", "linehl": "ClapCurrentSelection"}
let g:clap_layout = { 'relative': 'editor' }
let g:clap_enable_icon = 1
let g:clap_search_box_border_style = 'curve'
let g:clap_provider_grep_enable_icon = 1
let g:clap_prompt_format = '%spinner%%forerunner_status% %provider_id%: '

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


lua require('packman-config')

" autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()
let g:completion_chain_complete_list = [
    \  {'complete_items': ['lsp']},
    \  {'complete_items': ['snippet']},
    \  {'complete_items': ['buffers']},
    \  {'complete_items': ['path']},
    \  {'mode': '<c-p>'},
    \  {'mode': '<c-n>'}
  \]

let g:completion_word_ignored_ft = ['LuaTree','vista']

" 括号
let g:delimitMate_expand_cr = 0
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
au FileType markdown let b:delimitMate_nesting_quotes = ["`"]

" git
let g:signify_sign_add = '▋'
let g:signify_sign_change = '▋'
let g:signify_sign_delete = '▋'
let g:signify_sign_delete_first_line = '▘'
let g:signify_sign_show_count = 0

" itchyny/vim-cursorword
augroup user_plugin_cursorword
  autocmd!
  autocmd FileType defx,denite,fern,clap,vista let b:cursorword = 0
  autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif
  autocmd InsertEnter * let b:cursorword = 0
  autocmd InsertLeave * let b:cursorword = 1
augroup END

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

" itchyny/vim-cursorword
augroup user_plugin_cursorword
    autocmd!
    autocmd FileType defx,denite,fern,clap,vista let b:cursorword = 0
    autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif
    autocmd InsertEnter * let b:cursorword = 0
    autocmd InsertLeave * let b:cursorword = 1
augroup END

" defx
" call utils#source_file($VIM_PATH,'module/defx.vim')

" nvim-tree.lua
let g:nvim_tree_hide_dotfiles = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_bindings = {
	\ 'edit':            ['<CR>', 'l'],
	\ 'edit_vsplit':     's',
	\ 'edit_split':      'i',
	\}
let g:nvim_tree_icons = {
	\ 'default': '',
	\ 'symlink': '',
	\ 'git': {
	\   'unstaged': "✚",
	\   'staged': "✚",
	\   'unmerged': "≠",
	\   'renamed': "≫",
	\   'untracked': "★"
	\   },
\ }

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


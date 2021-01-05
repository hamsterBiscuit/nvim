" Write buffer (save)
nnoremap <C-s> :<C-u>write<CR>

inoremap <C-h> <BS>
inoremap <C-d> <Del>
imap <C-S> <esc>:w<CR>
imap <C-Q> <esc>:wq<CR>

" switch window
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <leader>ws :<C-u>sp<CR>
nnoremap <leader>wv :<C-u>vs<CR>

" coc.nvim
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nmap <silent> ]e <Plug>(coc-diagnostic-prev)
nmap <silent> [e <Plug>(coc-diagnostic-next)
nmap ]g <Plug>(coc-git-prevchunk)
nmap [g <Plug>(coc-git-nextchunk)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


" Whitespace jump (see plugin/whitespace.vim)
" nnoremap ]w :<C-u>WhitespaceNext<CR>
" nnoremap [w :<C-u>WhitespacePrev<CR>

" accelerated-jk
nmap <silent>j <Plug>(accelerated_jk_gj)
nmap <silent>k <Plug>(accelerated_jk_gk)

" vim-eft
nmap f <Plug>(eft-f)
xmap f <Plug>(eft-f)
omap f <Plug>(eft-f)
nmap F <Plug>(eft-F)
xmap F <Plug>(eft-F)
omap F <Plug>(eft-F)

" fuzzyfind 模糊搜索 快捷键
nnoremap <silent> <Leader>bb :<C-u>Clap buffers<CR>
nnoremap <silent> <Leader>fa :<C-u>Clap grep<CR>
nnoremap <silent> <Leader>ff :<C-u>Clap files<cr>
nnoremap <silent> <Leader>fh :<C-u>Clap history<CR>
nnoremap <silent> <Leader>fl :<C-u>Clap loclist<CR>

" 文件管理
nnoremap <silent> <Leader>e :<C-u>NvimTreeToggle<CR>
nnoremap <silent> <Leader>F :<C-u>NvimTreeFindFile<CR>

" Vista
nnoremap <silent> <Leader>v :<C-u>Vista!!<CR>

" operator mappings
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)

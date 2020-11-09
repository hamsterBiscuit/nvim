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

" completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr>gd <cmd>lua require'lspsaga.provider'.<CR>"

" Whitespace jump (see plugin/whitespace.vim)
nnoremap ]w :<C-u>WhitespaceNext<CR>
nnoremap [w :<C-u>WhitespacePrev<CR>

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
nnoremap <silent> <Leader>bb :<C-u>Telescope buffers<CR>
nnoremap <silent> <Leader>fa :<C-u>Telescope live_grep<CR>
nnoremap <silent> <Leader>ff :<C-u>Telescope find_files<cr>
nnoremap <silent> <Leader>fh :<C-u>Telescope oldfiles<CR>
nnoremap <silent> <Leader>fl :<C-u>Telescope loclist<CR>

" 文件管理
nnoremap <silent> <Leader>e
      \ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
    nnoremap <silent> <Leader>F
      \ :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>

" Vista
nnoremap <silent> <Leader>v :<C-u>Vista!!<CR>

" operator mappings
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)

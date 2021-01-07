" Write buffer (save)
nnoremap <C-s> :<C-u>write<CR>

" inoremap <C-h> <BS>
imap <C-h> <BS>
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

" vsnip Expand or jump
imap <expr> <C-n>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-n>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

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

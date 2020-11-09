" Write buffer (save)
nnoremap <C-s> :<C-u>write<CR>

" Whitespace jump (see plugin/whitespace.vim)
nnoremap ]w :<C-u>WhitespaceNext<CR>
nnoremap [w :<C-u>WhitespacePrev<CR>

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
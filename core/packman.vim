

call plug#begin('~/.vim/plugged')

" 颜色荧光笔
Plug 'norcalli/nvim-colorizer.lua'

" fuzzyfind 模糊搜索
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim', { 'on': 'Telescope' }

" 高亮
Plug 'glepnir/zephyr-nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" 文件管理
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'
Plug 'Shougo/defx.nvim'

" 补全
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'neovim/nvim-lspconfig'

" lang
Plug 'posva/vim-vue'

Plug 'editorconfig/editorconfig-vim'
call plug#end()


call plug#begin('~/.vim/plugged')

" 标签页
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/nvim-bufferline.lua'

" 开屏
Plug 'glepnir/dashboard-nvim'

" 操作视觉增强
Plug 'rhysd/accelerated-jk'
Plug 'itchyny/vim-cursorword'
Plug 'hrsh7th/vim-eft'
Plug 'Yggdroot/indentLine'
Plug 'tyru/caw.vim'
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-operator-surround'

" git
Plug 'mhinz/vim-signify'

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

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'ludovicchabant/vim-gutentags'
Plug 'liuchengxu/vista.vim'

" lang
Plug 'posva/vim-vue'

Plug 'Shougo/context_filetype.vim'

Plug 'editorconfig/editorconfig-vim'

call plug#end()
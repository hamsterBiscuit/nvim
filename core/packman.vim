

call plug#begin('~/.vim/plugged')

" 标签页 状态栏
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'akinsho/nvim-bufferline.lua'
" Plug 'glepnir/galaxyline.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'hardcoreplayers/vim-buffet'
Plug 'glepnir/spaceline.vim'

Plug 'glepnir/oceanic-material'

" 开屏
Plug 'glepnir/dashboard-nvim'

" 操作视觉增强
Plug 'rhysd/accelerated-jk'
Plug 'hrsh7th/vim-eft'
Plug 'tyru/caw.vim'
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-operator-surround'
Plug 'Yggdroot/indentLine'

" 颜色荧光笔
Plug 'norcalli/nvim-colorizer.lua'

" fuzzyfind 模糊搜索
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

" 文件管理
Plug 'kyazdani42/nvim-tree.lua'

" 补全
Plug 'neoclide/coc.nvim'

Plug 'ludovicchabant/vim-gutentags'
Plug 'liuchengxu/vista.vim'

" lang
Plug 'posva/vim-vue'

Plug 'Shougo/context_filetype.vim'

Plug 'editorconfig/editorconfig-vim'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

call plug#end()

local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

local packer = require('packer')
packer.init({git = {
  clone_timeout = nil
}})

return packer.startup(
  function()
    -- plugins manger
    use 'wbthomason/packer.nvim'
    -- 标签页 状态栏
    use 'kyazdani42/nvim-web-devicons'
    use 'akinsho/nvim-bufferline.lua'
    use 'glepnir/galaxyline.nvim'

    -- 开屏
    use 'glepnir/dashboard-nvim'

    -- 操作视觉增强
    use 'rhysd/accelerated-jk'
    use 'hrsh7th/vim-eft'
    use 'tyru/caw.vim'
    use 'kana/vim-operator-user'
    use 'rhysd/vim-operator-surround'
    use 'glepnir/indent-guides.nvim'
    use 'itchyny/vim-cursorword'

    -- 颜色荧光笔
    use 'norcalli/nvim-colorizer.lua'

    -- fuzzyfind 模糊搜索
    use {'liuchengxu/vim-clap', run = ':Clap install-binary!' }

    -- 高亮
    use 'glepnir/zephyr-nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    -- 文件管理
    use 'kyazdani42/nvim-tree.lua'

    -- 补全
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use 'steelsojka/completion-buffers'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'

    -- git
    use 'mhinz/vim-signify'

    use 'Raimondi/delimitMate'

    use 'ludovicchabant/vim-gutentags'
    use 'liuchengxu/vista.vim'

    -- lang
    use 'posva/vim-vue'
    use {'prettier/vim-prettier', run = 'yarn install', cmd = 'Prettier'}

    use 'Shougo/context_filetype.vim'

    use 'editorconfig/editorconfig-vim'

    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'  }
    end
)

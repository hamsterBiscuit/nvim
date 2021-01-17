local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.api.nvim_command("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

local packer = require("packer")
local use = packer.use
packer.init(
  {
    git = {
      clone_timeout = nil
    }
  }
)

return packer.startup(
  function()
    -- plugins manger
    use "wbthomason/packer.nvim"
    -- 标签页 状态栏
    use "kyazdani42/nvim-web-devicons"
    use {
      "akinsho/nvim-bufferline.lua",
      config = require("plugin-config.bufferline")
    }
    use {
      "datwaft/bubbly.nvim",
      config = require("plugin-config.bubbly")
    }

    -- 开屏
    use {
      "glepnir/dashboard-nvim",
      config = require("plugin-config.dashboard")
    }

    -- 操作视觉增强
    use {"rhysd/accelerated-jk"}
    use {"hrsh7th/vim-eft"}
    use {"tyru/caw.vim"}
    use {"psliwka/vim-smoothie", event = {"BufReadPre *", "BufNewFile *"}}
    use "kana/vim-operator-user"
    use "rhysd/vim-operator-surround"
    use {
      "Yggdroot/indentLine",
    }
    use {
      "itchyny/vim-cursorword",
      event = {"BufReadPre *", "BufNewFile *"},
      config = require("plugin-config.vim-cursorword")
    }

    -- 颜色荧光笔
    use {
      "norcalli/nvim-colorizer.lua",
      config = require("plugin-config.nvim-colorizer"),
      ft = {
        "html",
        "css",
        "sass",
        "scss",
        "vim",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "lua"
      }
    }

    -- fuzzyfind 模糊搜索
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        {"nvim-telescope/telescope-fzf-writer.nvim"},
        {"nvim-lua/popup.nvim"},
        {"nvim-lua/plenary.nvim"}
      },
      config = require("plugin-config.telescope")
    }

    -- 高亮
    use {
      "glepnir/zephyr-nvim",
      config = require("plugin-config.zephyr")
    }
    use {
      "nvim-treesitter/nvim-treesitter",
      requires = {{"nvim-treesitter/nvim-treesitter-textobjects"}},
      config = require("plugin-config.treesitter")
    }
    use {"sheerun/vim-polyglot"}

    -- 文件管理
    use {
      "kyazdani42/nvim-tree.lua",
      config = require("plugin-config.nvim-tree")
    }

    -- 补全
    use "neovim/nvim-lspconfig"
    use {
      "nvim-lua/completion-nvim",
      requires = {
        {"steelsojka/completion-buffers"},
        {"hrsh7th/vim-vsnip", event = "InsertCharPre *"},
        {"hrsh7th/vim-vsnip-integ", event = "InsertCharPre *"}
      }
    }

    -- git
    use {
      "mhinz/vim-signify",
      event = {"BufReadPre *", "BufNewFile *"},
      config = require("plugin-config.vim-signify")
    }

    use {"jiangmiao/auto-pairs", event = {"BufReadPre *", "BufNewFile *"}}

    use {
      "mhartington/formatter.nvim",
      cmd = "Format",
      config = require("plugin-config.formatter")
    }

    use {
      "ludovicchabant/vim-gutentags",
      config = require("plugin-config.vim-gutentags")
    }
    use {
      "liuchengxu/vista.vim",
      config = require("plugin-config.vista")
    }

    -- lang
    use {"prettier/vim-prettier", run = "yarn install", cmd = "Prettier"}

    use {"Shougo/context_filetype.vim", event = "BufReadPre *"}

    use "editorconfig/editorconfig-vim"

    use {"iamcco/markdown-preview.nvim", run = "cd app && yarn install", ft = "markdown"}
    use {
      "mattn/emmet-vim",
      event = "InsertEnter *",
      ft = {"html", "css", "javascript", "javascriptreact", "vue", "typescript", "typescriptreact"},
      config = require("plugin-config.emmet")
    }
  end
)

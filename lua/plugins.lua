local packer = nil

local function init()
  local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.api.nvim_command("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  end
  if packer == nil then
    vim.cmd [[packadd packer.nvim]]
    packer = require("packer")
    packer.init(
      {
        git = {
          clone_timeout = nil
        },
        disable_commands = true,
        display = {
          open_fn = function()
            return require("packer.util").float({border = "single"})
          end
        }
      }
    )
  end
  local use = packer.use
  packer.reset()

  -- plugins manger
  use {"wbthomason/packer.nvim"}

  use {
    "lewis6991/impatient.nvim",
    config = function()
      require("impatient").enable_profile()
    end
  }

  -- Theme
  use {
    "glepnir/zephyr-nvim",
    config = function()
      return require("zephyr")
    end
  }

  -- LSP
  use {
    "neovim/nvim-lspconfig"
  }
  use {
    "williamboman/nvim-lsp-installer",
    requires = {"hrsh7th/cmp-nvim-lsp"},
    config = [[require("lsp.setup")]]
  }
  use {"glepnir/lspsaga.nvim", config = [[require("lspsaga").init_lsp_saga()]]}

  -- auto completion
  use {
    "hrsh7th/nvim-cmp",
    config = [[require("plugin-config.nvim-compe")]],
    requires = {
      {"hrsh7th/cmp-nvim-lsp", after = "nvim-cmp"},
      {"hrsh7th/cmp-buffer", after = "nvim-cmp"},
      {"hrsh7th/cmp-path", after = "nvim-cmp"},
      {"quangnguyen30192/cmp-nvim-tags", after = "nvim-cmp"},
      {"hrsh7th/cmp-vsnip", after = "nvim-cmp"},
      {
        "hrsh7th/vim-vsnip",
        after = "nvim-cmp",
        requires = {
          {"xabikos/vscode-javascript"},
          {"hollowtree/vscode-vue-snippets"}
        },
        config = [[require("plugin-config.vsnip")]]
      },
      {"hrsh7th/vim-vsnip-integ", after = "nvim-cmp"},
      {"kristijanhusak/vim-dadbod-completion"},
      {"hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp"},
      {"hrsh7th/cmp-cmdline", after = "cmp-buffer"},
      {"onsails/lspkind-nvim", requires = "nvim-cmp"},
      {"rafamadriz/friendly-snippets", requires = "nvim-cmp"}
    }
  }

  -- Navbar
  use {
    "akinsho/bufferline.nvim",
    requires = {"kyazdani42/nvim-web-devicons"},
    config = [[require("plugin-config.bufferline")]]
  }
  -- Status bar
  use {
    "nvim-lualine/lualine.nvim",
    requires = {"kyazdani42/nvim-web-devicons"},
    config = function()
      require("lualine").setup(
        {
          theme = "tokyonight"
        }
      )
    end
  }

  -- Dashboard
  use {
    "glepnir/dashboard-nvim",
    config = [[require("plugin-config.dashboard")]]
  }

  -- Typing
  use {
    "xiyaowong/accelerated-jk.nvim",
    config = function()
      require("accelerated-jk").setup {
        -- equal to
        -- nmap <silent> j <cmd>lua require'accelerated-jk'.command('gj')<cr>
        -- nmap <silent> k <cmd>lua require'accelerated-jk'.command('gk')<cr>
        mappings = {j = "gj", k = "gk"},
        -- If the interval of key-repeat takes more than `acceleration_limit` ms, the step is reset
        acceleration_limit = 150,
        -- acceleration steps
        acceleration_table = {7, 12, 17, 21, 24, 26, 28, 30},
        -- If you want to decelerate a cursor moving by time instead of reset. set it
        -- exampe:
        -- {
        --   { 200, 3 },
        --   { 300, 7 },
        --   { 450, 11 },
        --   { 600, 15 },
        --   { 750, 21 },
        --   { 900, 9999 },
        -- }
        deceleration_table = {{150, 9999}}
      }
    end
  }
  -- Comment
  use {
    "numToStr/Comment.nvim",
    requires = {"JoosepAlviste/nvim-ts-context-commentstring"},
    config = function()
      require("plugin-config.Comment")
    end
  }
  -- f t
  use {"ggandor/lightspeed.nvim"}

  -- 平滑滚动插件 半屏或者整屏翻页变为滚动效果
  use {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup()
    end
  }
  -- 增删改引号
  use {
    "ur4ltz/surround.nvim",
    config = function()
      require "surround".setup {mappings_style = "surround"}
    end
  }

  -- 缩进线插件
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      return require("indent_blankline").setup(
        {
          filetype_exclude = {
            "alpha",
            "packer",
            "terminal",
            "lsp-installer",
            "lspinfo"
          }
        }
      )
    end
  }

  -- 当前光标下划线 高亮
  use {"yamatsum/nvim-cursorline"}

  -- 颜色荧光笔
  use {
    "norcalli/nvim-colorizer.lua",
    config = [[require("plugin-config.nvim-colorizer")]]
  }

  -- fuzzyfind 模糊搜索
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      {"nvim-lua/popup.nvim", opt = true},
      {"nvim-lua/plenary.nvim", opt = true}
    },
    config = [[require("plugin-config.telescope")]]
  }

  -- 高亮
  use {
    "nvim-treesitter/nvim-treesitter",
    requires = {
      {"nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter"},
      {"p00f/nvim-ts-rainbow", after = "nvim-treesitter"},
      {"JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter"},
      {
        "lewis6991/spellsitter.nvim",
        after = "nvim-treesitter",
        config = function()
          require("spellsitter").setup()
        end
      }
    },
    config = [[require("plugin-config.treesitter")]]
  }

  -- 文件管理
  use {
    "kyazdani42/nvim-tree.lua",
    config = [[require("plugin-config.nvim-tree")]]
  }

  -- git信息展示 :SignifyDiff
  use {
    "lewis6991/gitsigns.nvim",
    config = [[require("plugin-config.gitsigns")]],
    requires = {
      "nvim-lua/plenary.nvim"
    }
  }

  -- 自动括号括回
  use {
    "windwp/nvim-autopairs",
    requires = "nvim-cmp",
    config = function()
      require("nvim-autopairs").setup {}
    end
  }

  -- 目前配置了lua和js，ts的格式化
  use {
    "mhartington/formatter.nvim",
    config = [[require("plugin-config.formatter")]]
  }

  -- Tag 展示插件，目前主要使用lsp提供，CTAG也依然好用
  use {
    "simrat39/symbols-outline.nvim"
  }

  -- lang Prettier 用来格式化js ts文件，formatter 配置为默认使用项目下
  -- Prettier,这个是全局的
  use {"prettier/vim-prettier", run = "yarn install"}

  use {"b0o/schemastore.nvim"}

  -- editorconfig
  -- 编辑器配置，个大编辑器都有实现或者有插件，用来统一项目的编辑格式，比如缩进等文件规范
  use {
    "editorconfig/editorconfig-vim"
  }

  use {
    "npxbr/glow.nvim",
    run = ":GlowInstall"
  }

  use {
    "kristijanhusak/vim-dadbod-ui",
    config = [[require("plugin-config.dadod")]],
    requires = {{"tpope/vim-dadbod", opt = true}}
  }
  use {"leafOfTree/vim-vue-plugin"}
  use {
    "Pocco81/AutoSave.nvim",
    config = function()
      require("plugin-config.autoSave")
    end
  }
  use {
    "ethanholz/nvim-lastplace",
    config = function()
      require("plugin-config.nvim-lastplace")
    end
  }
  use {
    "petertriho/nvim-scrollbar",
    config = function()
      require("plugin-config.nvim-scrollbar")
    end
  }
  use {
    "akinsho/toggleterm.nvim",
    config = function()
      require("plugin-config.toggleterm")
    end
  }
  use {
    "rcarriga/nvim-notify",
    config = function()
      require("plugin-config.nvim-notify")
    end
  }
  use {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup {}
    end
  }
  use {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup(
        {
          bind = true,
          handler_opts = {
            border = "rounded"
          },
          hint_enable = false,
          floating_window = true,
          hi_parameter = "LspSignatureActiveParameter"
        }
      )
    end
  }
  use {
    "kosayoda/nvim-lightbulb",
    config = function()
      require("plugin-config.nvim-lightbulb")
    end
  }
end

local plugins =
  setmetatable(
  {},
  {
    __index = function(_, key)
      init()
      return packer[key]
    end
  }
)

return plugins

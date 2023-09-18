local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system(
    {
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath
    }
  )
end
vim.opt.rtp:prepend(lazypath)

local enable_lsp_filetype = {
  "go",
  "lua",
  "sh",
  "rust",
  "c",
  "cpp",
  "typescript",
  "typescriptreact",
  "javascript",
  "javascriptreact",
  "vue",
  "css",
  "html",
  "sass",
  "less",
  "stylus",
  "json",
  "python"
}
local lazy_config = {
  checker = {
    -- automatically check for plugin updates
    enabled = true,
    concurrency = nil, ---@type number? set to 1 to check for updates very slowly
    notify = false, -- get a notification when new updates are found
    frequency = 3600 -- check for updates every hour
  }
}
require("lazy").setup(
  {
    -- plugins manger
    "folke/lazy.nvim",
    -- Theme
    {
      "glepnir/zephyr-nvim",
      dependencies = {"nvim-treesitter/nvim-treesitter"},
      config = function()
        require("zephyr")
      end
    },
    -- LSP
    {
      "williamboman/mason.nvim",
      dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "b0o/schemastore.nvim"
      },
      ft = enable_lsp_filetype
    },
    {
      "neovim/nvim-lspconfig",
      ft = enable_lsp_filetype,
      config = function()
        require("lsp.setup")
      end
    },
    -- lspui
    {
      "jinzhongjia/LspUI.nvim",
      branch = "main",
      after = "nvim-lspconfig",
      config = function()
        require("LspUI").setup()
      end
    },
    -- {"nvimdev/lspsaga.nvim", after = "nvim-lspconfig", config = [[require("plugin-config.lspsaga")]]},
    -- auto completion
    {
      "hrsh7th/nvim-cmp",
      config = function()
        require("plugin-config.nvim-cmp")
      end,
      event = "VeryLazy",
      dependencies = {
        {"hrsh7th/cmp-nvim-lsp"},
        {"hrsh7th/cmp-buffer"},
        {"FelipeLema/cmp-async-path"},
        {"hrsh7th/cmp-path"},
        {"hrsh7th/cmp-vsnip"},
        {"hrsh7th/vim-vsnip"},
        {"hrsh7th/vim-vsnip-integ"},
        {"hrsh7th/cmp-nvim-lsp-signature-help"},
        {"hrsh7th/cmp-cmdline"},
        {"onsails/lspkind-nvim"},
        {"rafamadriz/friendly-snippets"}
      }
    },
    -- Navbar
    {
      "akinsho/bufferline.nvim",
      event = {"UIEnter"},
      dependencies = {"nvim-tree/nvim-web-devicons", "moll/vim-bbye"},
      config = function()
        require("plugin-config.bufferline")
      end
    },
    -- Status bar
    {
      "nvim-lualine/lualine.nvim",
      event = "UIEnter",
      dependencies = {
        "nvim-tree/nvim-web-devicons"
      },
      config = function()
        require("lualine").setup({})
      end
    },
    -- Dashboard
    {
      "glepnir/dashboard-nvim",
      config = function()
        require("plugin-config.dashboard")
      end
    },
    -- Typing
    {
      "xiyaowong/fast-cursor-move.nvim",
      event = {"BufRead", "BufNewFile"}
    },
    -- Comment
    {
      "numToStr/Comment.nvim",
      event = {"BufRead", "BufNewFile"},
      dependencies = {"JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter"},
      config = function()
        require("plugin-config.Comment")
      end
    },
    -- f t
    {
      "ggandor/leap.nvim",
      dependencies = {"tpope/vim-repeat"},
      config = function()
        require("leap").add_default_mappings()
      end
    },
    -- 平滑滚动插件 半屏或者整屏翻页变为滚动效果
    {
      "karb94/neoscroll.nvim",
      event = {"BufRead", "BufNewFile"},
      config = function()
        require("neoscroll").setup()
      end
    },
    -- 增删改引号
    {
      "ur4ltz/surround.nvim",
      event = {"BufRead", "BufNewFile"},
      config = function()
        require "surround".setup {mappings_style = "surround"}
      end
    },
    -- 缩进线插件
    {
      "lukas-reineke/indent-blankline.nvim",
      event = {"BufRead", "BufNewFile"},
      config = function()
        return require("indent_blankline").setup(
          {
            char = "│",
            use_treesitter_scope = true,
            show_first_indent_level = true,
            show_current_context = false,
            show_current_context_start = false,
            show_current_context_start_on_current_line = false,
            filetype_exclude = {
              "dashboard",
              "DogicPrompt",
              "log",
              "fugitive",
              "gitcommit",
              "packer",
              "markdown",
              "json",
              "txt",
              "vista",
              "help",
              "todoist",
              "NvimTree",
              "git",
              "TelescopePrompt",
              "undotree"
            },
            buftype_exclude = {"terminal", "nofile", "prompt"},
            context_patterns = {
              "class",
              "function",
              "method",
              "block",
              "list_literal",
              "selector",
              "^if",
              "^table",
              "if_statement",
              "while",
              "for"
            }
          }
        )
      end
    },
    -- 当前光标下划线 高亮
    {
      "yamatsum/nvim-cursorline",
      event = {"BufRead", "BufNewFile"},
      config = function()
        require("plugin-config.nvim-cursorline")
      end
    },
    -- 颜色荧光笔
    {
      "norcalli/nvim-colorizer.lua",
      event = {"BufRead", "BufNewFile"},
      config = function()
        require("plugin-config.nvim-colorizer")
      end
    },
    -- fuzzyfind 模糊搜索
    {
      "nvim-telescope/telescope.nvim",
      cmd = "Telescope",
      dependencies = {
        "nvim-lua/plenary.nvim"
      },
      config = function()
        require("plugin-config.telescope")
      end
    },
    -- 高亮
    {
      "nvim-treesitter/nvim-treesitter",
      dependencies = {
        {"nvim-treesitter/nvim-treesitter-textobjects"},
        {"p00f/nvim-ts-rainbow"},
        {"JoosepAlviste/nvim-ts-context-commentstring"},
        {
          "lewis6991/spellsitter.nvim",
          after = "nvim-treesitter",
          config = function()
            require("spellsitter").setup()
          end
        }
      },
      event = "BufRead",
      config = function()
        require("plugin-config.treesitter")
      end
    },
    -- 文件管理
    {
      "nvim-tree/nvim-tree.lua",
      cmd = {"NvimTreeToggle", "NvimTreeFindFile"},
      config = function()
        require("plugin-config.nvim-tree")
      end
    },
    -- git信息展示 :SignifyDiff
    {
      "lewis6991/gitsigns.nvim",
      event = {"BufRead", "BufNewFile"},
      config = function()
        require("plugin-config.gitsigns")
      end,
      dependencies = {
        "nvim-lua/plenary.nvim"
      }
    },
    -- 自动括号括回
    {
      "windwp/nvim-autopairs",
      dependencies = "nvim-cmp",
      evnet = "InsertEnter",
      config = function()
        require("nvim-autopairs").setup {}
      end
    },
    {
      "glepnir/hlsearch.nvim",
      event = "BufRead",
      config = function()
        require("hlsearch").setup()
      end
    },
    -- 目前配置了lua和js，ts的格式化
    {
      "mhartington/formatter.nvim",
      cmd = "Format",
      config = function()
        require("plugin-config.formatter")
      end
    },
    -- lang Prettier 用来格式化js ts文件，formatter 配置为默认使用项目下
    -- Prettier,这个是全局的
    {"prettier/vim-prettier", cmd = "Prettier", build = "yarn install"},
    -- editorconfig
    -- 编辑器配置，个大编辑器都有实现或者有插件，用来统一项目的编辑格式，比如缩进等文件规范
    {
      "editorconfig/editorconfig-vim",
      ft = enable_lsp_filetype
    },
    {
      "ellisonleao/glow.nvim",
      config = function()
        require("glow").setup()
      end,
      cmd = "Glow"
    },
    {
      "kristijanhusak/vim-dadbod-ui",
      cmd = {"DBUIToggle", "DBUIAddConnection", "DBUI", "DBUIFindBuffer", "DBUIRenameBuffer"},
      config = function()
        require("plugin-config.dadod")
      end,
      dependencies = {{"tpope/vim-dadbod"}}
    },
    {"leafOfTree/vim-vue-plugin", ft = "vue"},
    {
      "ethanholz/nvim-lastplace",
      event = {"BufRead", "BufNewFile"},
      config = function()
        require("plugin-config.nvim-lastplace")
      end
    },
    {
      "petertriho/nvim-scrollbar",
      event = {"BufRead", "BufNewFile"},
      config = function()
        require("plugin-config.nvim-scrollbar")
      end
    },
    {
      "akinsho/toggleterm.nvim",
      cmd = "ToggleTerm",
      config = function()
        require("plugin-config.toggleterm")
      end
    },
    {
      "rcarriga/nvim-notify",
      config = function()
        require("plugin-config.nvim-notify")
      end
    },
    {
      "j-hui/fidget.nvim",
      tag = "legacy",
      ft = enable_lsp_filetype,
      config = function()
        require("fidget").setup {}
      end
    },
    {
      "ray-x/lsp_signature.nvim",
      event = "InsertEnter",
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
  },
  lazy_config
)

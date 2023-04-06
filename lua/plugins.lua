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
    -- {"glepnir/lspsaga.nvim", after = "nvim-lspconfig", config = [[require("plugin-config.lspsaga")]]},
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
      event = {"BufRead", "BufNewFile"},
      dependencies = {"nvim-tree/nvim-web-devicons", "moll/vim-bbye"},
      config = function()
        require("plugin-config.bufferline")
      end
    },
    -- Status bar
    {
      "glepnir/galaxyline.nvim",
      dependencies = "nvim-tree/nvim-web-devicons",
      config = function()
        require("plugin-config.galaxyline")
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
      "xiyaowong/accelerated-jk.nvim",
      event = {"BufRead", "BufNewFile"},
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
      "ggandor/lightspeed.nvim",
      keys = {
        "<Plug>Lightspeed_s",
        "<Plug>Lightspeed_S",
        "<Plug>Lightspeed_x",
        "<Plug>Lightspeed_X",
        "<Plug>Lightspeed_f",
        "<Plug>Lightspeed_F",
        "<Plug>Lightspeed_t",
        "<Plug>Lightspeed_T"
      },
      config = function()
        local default_keymaps = {
          {"n", "s", "<Plug>Lightspeed_s"},
          {"n", "S", "<Plug>Lightspeed_S"},
          {"x", "s", "<Plug>Lightspeed_s"},
          {"x", "S", "<Plug>Lightspeed_S"},
          {"o", "z", "<Plug>Lightspeed_s"},
          {"o", "Z", "<Plug>Lightspeed_S"},
          {"o", "x", "<Plug>Lightspeed_x"},
          {"o", "X", "<Plug>Lightspeed_X"},
          {"n", "f", "<Plug>Lightspeed_f"},
          {"n", "F", "<Plug>Lightspeed_F"},
          {"x", "f", "<Plug>Lightspeed_f"},
          {"x", "F", "<Plug>Lightspeed_F"},
          {"o", "f", "<Plug>Lightspeed_f"},
          {"o", "F", "<Plug>Lightspeed_F"},
          {"n", "t", "<Plug>Lightspeed_t"},
          {"n", "T", "<Plug>Lightspeed_T"},
          {"x", "t", "<Plug>Lightspeed_t"},
          {"x", "T", "<Plug>Lightspeed_T"},
          {"o", "t", "<Plug>Lightspeed_t"},
          {"o", "T", "<Plug>Lightspeed_T"}
        }
        for _, m in ipairs(default_keymaps) do
          vim.api.nvim_set_keymap(m[1], m[2], m[3], {silent = true})
        end
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
        "nvim-lua/popup.nvim",
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
      "kyazdani42/nvim-tree.lua",
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
      "npxbr/glow.nvim",
      cmd = "Glow",
      build = ":GlowInstall"
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
    },
    {"antoinemadec/FixCursorHold.nvim", event = "BufReadPre"}
  },
  lazy_config
)

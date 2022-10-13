local fn = vim.fn
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap = nil
if fn.empty(fn.glob(install_path)) > 0 then
  vim.notify("正在安装Pakcer.nvim，请稍后...")
  -- "!git clone https://github.com/wbthomason/packer.nvim " .. install_path
  packer_bootstrap =
    fn.system(
    {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path
    }
  )

  -- https://github.com/wbthomason/packer.nvim/issues/750
  local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
  if not string.find(vim.o.runtimepath, rtp_addition) then
    vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
  end
  vim.notify("Pakcer.nvim 安装完毕")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("没有安装 packer.nvim")
  return
end

packer.startup(
  {
    function(use)
      -- plugins manger
      use {"wbthomason/packer.nvim"}

      use {
        "lewis6991/impatient.nvim"
      }
      -- Theme
      use {
        "glepnir/zephyr-nvim",
        requires = {"nvim-treesitter/nvim-treesitter", opt = true},
        config = function()
          require("zephyr")
        end
      }

      -- LSP
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
      use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        ft = enable_lsp_filetype
      }
      use {
        "neovim/nvim-lspconfig",
        ft = enable_lsp_filetype,
        config = function()
          require("lsp.setup")
        end
      }
      use {"glepnir/lspsaga.nvim", after = "nvim-lspconfig", config = [[require("plugin-config.lspsaga")]]}

      -- auto completion
      use {
        "hrsh7th/nvim-cmp",
        config = [[require("plugin-config.nvim-cmp")]],
        event = "InsertEnter",
        requires = {
          {"hrsh7th/cmp-nvim-lsp", after = "nvim-lspconfig"},
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
        event = {"BufRead", "BufNewFile"},
        requires = {"kyazdani42/nvim-web-devicons"},
        config = [[require("plugin-config.bufferline")]]
      }
      -- Status bar
      use {
        "glepnir/galaxyline.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = [[require("plugin-config.galaxyline")]]
      }

      -- Dashboard
      use {
        "glepnir/dashboard-nvim",
        config = [[require("plugin-config.dashboard")]]
      }

      -- Typing
      use {
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
      }
      -- Comment
      use {
        "numToStr/Comment.nvim",
        event = {"BufRead", "BufNewFile"},
        requires = {"JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter"},
        config = function()
          require("plugin-config.Comment")
        end
      }
      -- f t
      use {
        "ggandor/lightspeed.nvim",
        event = {"BufRead", "BufNewFile"}
      }

      -- 平滑滚动插件 半屏或者整屏翻页变为滚动效果
      use {
        "karb94/neoscroll.nvim",
        event = {"BufRead", "BufNewFile"},
        config = function()
          require("neoscroll").setup()
        end
      }
      -- 增删改引号
      use {
        "ur4ltz/surround.nvim",
        event = {"BufRead", "BufNewFile"},
        config = function()
          require "surround".setup {mappings_style = "surround"}
        end
      }

      -- 缩进线插件
      use {
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
      }

      -- 当前光标下划线 高亮
      use {
        "yamatsum/nvim-cursorline",
        event = {"BufRead", "BufNewFile"},
        config = [[require("plugin-config.nvim-cursorline")]]
      }

      -- 颜色荧光笔
      use {
        "norcalli/nvim-colorizer.lua",
        event = {"BufRead", "BufNewFile"},
        config = [[require("plugin-config.nvim-colorizer")]]
      }

      -- fuzzyfind 模糊搜索
      use {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
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
        event = "BufRead",
        after = "telescope.nvim",
        config = [[require("plugin-config.treesitter")]]
      }

      -- 文件管理
      use {
        "kyazdani42/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        config = [[require("plugin-config.nvim-tree")]]
      }

      -- git信息展示 :SignifyDiff
      use {
        "lewis6991/gitsigns.nvim",
        event = {"BufRead", "BufNewFile"},
        config = [[require("plugin-config.gitsigns")]],
        requires = {
          "nvim-lua/plenary.nvim"
        }
      }

      -- 自动括号括回
      use {
        "windwp/nvim-autopairs",
        requires = "nvim-cmp",
        evnet = "InsertEnter",
        config = function()
          require("nvim-autopairs").setup {}
        end
      }

      -- 目前配置了lua和js，ts的格式化
      use {
        "mhartington/formatter.nvim",
        cmd = "Format",
        config = [[require("plugin-config.formatter")]]
      }

      -- lang Prettier 用来格式化js ts文件，formatter 配置为默认使用项目下
      -- Prettier,这个是全局的
      use {"prettier/vim-prettier", cmd = "Prettier", run = "yarn install"}

      -- 一个Neovim Lua插件，提供对SchemaStore目录的访问。
      use {"b0o/schemastore.nvim", opt = true}

      -- editorconfig
      -- 编辑器配置，个大编辑器都有实现或者有插件，用来统一项目的编辑格式，比如缩进等文件规范
      use {
        "editorconfig/editorconfig-vim",
        ft = enable_lsp_filetype
      }

      use {
        "npxbr/glow.nvim",
        cmd = "Glow",
        run = ":GlowInstall"
      }

      use {
        "kristijanhusak/vim-dadbod-ui",
        cmd = {"DBUIToggle", "DBUIAddConnection", "DBUI", "DBUIFindBuffer", "DBUIRenameBuffer"},
        config = [[require("plugin-config.dadod")]],
        requires = {{"tpope/vim-dadbod", opt = true}}
      }
      use {"leafOfTree/vim-vue-plugin", ft = "vue"}
      use {
        "ethanholz/nvim-lastplace",
        event = {"BufRead", "BufNewFile"},
        config = function()
          require("plugin-config.nvim-lastplace")
        end
      }
      use {
        "petertriho/nvim-scrollbar",
        event = {"BufRead", "BufNewFile"},
        config = function()
          require("plugin-config.nvim-scrollbar")
        end
      }
      use {
        "akinsho/toggleterm.nvim",
        cmd = "ToggleTerm",
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
        ft = enable_lsp_filetype,
        config = function()
          require("fidget").setup {}
        end
      }
      use {
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
      use {"antoinemadec/FixCursorHold.nvim", event = "BufReadPre"}
      if packer_bootstrap then
        packer.sync()
      end
    end,
    config = {
      profile = {
        enable = true,
        threshold = 1
      },
      git = {
        clone_timeout = 1000
      }
    }
  }
)

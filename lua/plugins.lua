local packer = nil
local packer_compiled = vim.fn.stdpath("data") .. "/site/packer_compiled.vim"

local function init()
  local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.api.nvim_command("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  end
  if packer == nil then
    vim.cmd [[packadd packer.nvim]]
    packer = require("packer")
    packer.init(
      {
        -- compile_path = packer_compiled,
        git = {
          clone_timeout = nil
        },
        disable_commands = true
      }
    )
  end
  local use = packer.use
  packer.reset()

  use {"olimorris/onedarkpro.nvim", config = [[vim.cmd('colorscheme onedarkpro')]]}

  -- plugins manger
  use {"wbthomason/packer.nvim", opt = true}
  -- 补全
  use {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    config = [[require("plugin-config.lsp")]]
  }
  use { 'tami5/lspsaga.nvim' }
  use {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = [[require("plugin-config.nvim-compe")]],
    requires = {
      {"hrsh7th/cmp-nvim-lsp", after = "nvim-cmp"},
      {"hrsh7th/cmp-buffer", after = "nvim-cmp"},
      {"hrsh7th/cmp-path", after = "nvim-cmp"},
      {"f3fora/cmp-spell", after = "nvim-cmp"},
      {"quangnguyen30192/cmp-nvim-tags", after = "nvim-cmp"},
      {"hrsh7th/cmp-vsnip", after = "nvim-cmp"},
      {
        "hrsh7th/vim-vsnip",
        after = "nvim-cmp",
        requires = {
          {"dsznajder/vscode-es7-javascript-react-snippets"},
          {"xabikos/vscode-javascript"},
          {"hollowtree/vscode-vue-snippets"}
        },
        config = [[require("plugin-config.vsnip")]]
      },
      {"hrsh7th/vim-vsnip-integ", after = "nvim-cmp"},
      {"kristijanhusak/vim-dadbod-completion", event = "InsertCharPre"}
    }
  }

  -- 标签页 状态栏
  -- tab 栏插件 提供 leader + number 切换buffer
  use {
    "akinsho/nvim-bufferline.lua",
    requires = {"kyazdani42/nvim-web-devicons"},
    config = [[require("plugin-config.bufferline")]]
  }
  -- 状态栏插件
  use {
    "nvim-lualine/lualine.nvim",
    requires = {"kyazdani42/nvim-web-devicons", opt = true},
    config = function()
      local custom_gruvbox = require "lualine.themes.onedark"
      require("lualine").setup(
        {
          theme = custom_gruvbox
        }
      )
    end
  }

  -- 开屏
  use { "lewis6991/impatient.nvim", config = function() require('impatient').enable_profile() end }
  use {
    "goolord/alpha-nvim",
    config = function()
      require "alpha".setup(require "alpha.themes.dashboard".config)
    end
  }

  -- 操作视觉增强
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
  -- gc gcc 注释插件
  use {
    "terrortylor/nvim-comment",
    keys = {"gc", "gcc"},
    config = function()
      require("nvim_comment").setup(
        {
          hook = function()
            if vim.api.nvim_buf_get_option(0, "filetype") == "vue" then
              require("ts_context_commentstring.internal").update_commentstring()
            end
          end
        }
      )
    end
  }
  -- f t 增强
  use {"ggandor/lightspeed.nvim"}
  -- 平滑滚动插件 半屏或者整屏翻页变为滚动效果
  use {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup()
    end,
    event = {"BufRead", "BufNewFile"}
  }
  -- 增删改引号
  use {
    "blackCauldron7/surround.nvim",
    config = function()
      require "surround".setup {mappings_style = "sandwich"}
    end
  }
  -- 缩进线插件
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = [[require("indent_blankline")]],
    event = {"BufReadPre", "BufNewFile"}
  }
  -- 当前光标下划线 高亮
  use {"yamatsum/nvim-cursorline"}

  -- 颜色荧光笔
  use {
    "norcalli/nvim-colorizer.lua",
    config = [[require("plugin-config.nvim-colorizer")]],
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
    cmd = "Telescope",
    requires = {
      {"nvim-lua/popup.nvim", opt = true},
      {"nvim-lua/plenary.nvim", opt = true}
    },
    config = [[require("plugin-config.telescope")]]
  }

  -- 高亮 主题
  use {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
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
    event = {"BufRead", "BufNewFile"},
    config = [[require("plugin-config.gitsigns")]],
    requires = {
      "nvim-lua/plenary.nvim",
      opt = true
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
    cmd = "Format",
    config = [[require("plugin-config.formatter")]]
  }

  -- Tag 展示插件，目前主要使用lsp提供，CTAG也依然好用
  use {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline"
  }

  -- lang Prettier 用来格式化js ts文件，formatter 配置为默认使用项目下
  -- Prettier,这个是全局的
  use {"prettier/vim-prettier", run = "yarn install", cmd = "Prettier"}

  -- editorconfig
  -- 编辑器配置，个大编辑器都有实现或者有插件，用来统一项目的编辑格式，比如缩进等文件规范
  use {
    "editorconfig/editorconfig-vim",
    ft = {
      "go",
      "typescript",
      "javascript",
      "vim",
      "rust",
      "zig",
      "c",
      "cpp",
      "vue",
      "typescriptreact",
      "javascriptreact"
    }
  }

  use {
    "npxbr/glow.nvim",
    run = ":GlowInstall",
    cmd = "Glow"
  }

  -- emmet插件 使用 ,, 触发补全，
  use {
    "mattn/emmet-vim",
    ft = {"html", "css", "javascript", "javascriptreact", "vue", "typescript", "typescriptreact"},
    setup = [[require("plugin-config.emmet")]],
    config = function()
      vim.api.nvim_command(
        [[autocmd FileType html,css,javascript,javascriptreact,vue,typescript,typescriptreact EmmetInstall]]
      )
    end
  }
  use {
    "kristijanhusak/vim-dadbod-ui",
    cmd = {"DBUIToggle", "DBUIAddConnection", "DBUI", "DBUIFindBuffer", "DBUIRenameBuffer"},
    config = [[require("plugin-config.dadod")]],
    requires = {{"tpope/vim-dadbod", opt = true}}
  }
  use {"leafOfTree/vim-vue-plugin", ft = {"vue"}}
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

function plugins.convert_compile_file()
  local compile_to_lua = vim.fn.stdpath("data") .. "/site/lua/_compiled.lua"
  local lines = {}
  local lnum = 1
  lines[#lines + 1] = "vim.cmd [[packadd packer.nvim]]\n"

  for line in io.lines(packer_compiled) do
    lnum = lnum + 1
    if lnum > 15 then
      lines[#lines + 1] = line .. "\n"
      if line == "END" then
        break
      end
    end
  end
  table.remove(lines, #lines)

  if vim.fn.filereadable(compile_to_lua) == 1 then
    os.remove(compile_to_lua)
  else
    if vim.fn.isdirectory(vim.fn.stdpath("data") .. "/site/lua") ~= 1 then
      os.execute("mkdir -p " .. vim.fn.stdpath("data") .. "/site/lua")
    end
  end

  local file = io.open(compile_to_lua, "w")
  for _, line in ipairs(lines) do
    file:write(line)
  end
  file:close()

  os.remove(packer_compiled)
end

function plugins.magic_compile()
  plugins.compile()
  plugins.convert_compile_file()
end

return plugins

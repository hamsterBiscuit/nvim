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

  use {"glepnir/zephyr-nvim", config = [[vim.cmd('colorscheme zephyr')]]}

  -- plugins manger
  use {"wbthomason/packer.nvim", opt = true}
  -- 补全
  use {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    config = [[require("plugin-config.lsp")]]
  }
  use {
    "glepnir/lspsaga.nvim",
    cmd = "Lspsaga"
  }
  use {
    "hrsh7th/nvim-compe",
    event = "InsertEnter",
    config = [[require("plugin-config.nvim-compe")]],
    requires = {
      {
        "hrsh7th/vim-vsnip",
        event = "InsertCharPre",
        requires = {
          {"dsznajder/vscode-es7-javascript-react-snippets"},
          {"xabikos/vscode-javascript"},
          {"hollowtree/vscode-vue-snippets"}
        },
        config = [[require("plugin-config.vsnip")]]
      },
      {"hrsh7th/vim-vsnip-integ", event = "InsertCharPre"},
      {"kristijanhusak/vim-dadbod-completion", event = "InsertCharPre"},
      {"tzachar/compe-tabnine", event = "InsertCharPre", run = "./install.sh"}
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
    "glepnir/galaxyline.nvim",
    requires = {"kyazdani42/nvim-web-devicons"},
    config = [[require("eviline")]]
  }

  -- 开屏
  use {
    "glepnir/dashboard-nvim",
    config = [[require("plugin-config.dashboard")]]
  }

  -- 操作视觉增强
  use {"rhysd/accelerated-jk"}
  -- gc gcc 注释插件
  use {
    "tyru/caw.vim",
    keys = {"gc", "gcc"},
    config = [[require("plugin-config.caw")]],
    requires = {
      "Shougo/context_filetype.vim",
      config = function()
        vim.g["context_filetype#search_offset"] = 2000
      end
    }
  }
  -- f t 增强
  use {'ggandor/lightspeed.nvim'}
  -- 平滑滚动插件 半屏或者整屏翻页变为滚动效果
  use {"psliwka/vim-smoothie", event = {"BufRead", "BufNewFile"}}
  use {
    "skywind3000/asynctasks.vim",
    setup = function()
      vim.cmd [[packadd vim-terminal-help]]
      vim.g.asynctasks_term_pos = "thelp"
      vim.g.asynctasks_term_rows = 10
    end,
    cmd = {"AsyncTask", "AsyncTaskMacro", "AsyncTaskList", "AsyncTaskEdit"},
    requires = {
      {
        "skywind3000/asyncrun.vim",
        cmd = {"AsyncRun", "AsyncStop"},
        setup = function()
          vim.g.asyncrun_open = 6
        end
      },
      {
        "skywind3000/vim-terminal-help",
        event = {"BufReadPre", "BufNewFile"}
      }
    }
  }
  -- 增删改引号
  use {
    "rhysd/vim-operator-surround",
    requires = {"kana/vim-operator-user"},
    config = [[require("plugin-config.surround")]],
    keys = {{"v", "sa"}, {"v", "sr"}, {"v", "sd"}}
  }
  use {"mhinz/vim-sayonara", cmd = "Sayonara"}
  -- 缩进线插件
  use {
    "lukas-reineke/indent-blankline.nvim",
    branch = "lua",
    config = [[requrie("indent-blankline")]],
    event = {"BufReadPre", "BufNewFile"}
  }
  -- 当前光标下划线 高亮
  use {
    "itchyny/vim-cursorword",
    event = {"BufRead", "BufNewFile"},
    config = [[require("plugin-config.vim-cursorword")]]
  }

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
      {"p00f/nvim-ts-rainbow", after = "nvim-treesitter"}
    },
    config = [[require("plugin-config.treesitter")]]
  }

  -- 文件管理
  -- use {
  --   "kyazdani42/nvim-tree.lua",
  --   config = [[require("plugin-config.nvim-tree")]]
  -- }

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
    "Raimondi/delimitMate",
    event = {"BufReadPre", "BufNewFile"},
    config = [[require("plugin-config.delimitMate")]]
  }

  -- 目前配置了lua和js，ts的格式化
  use {
    "mhartington/formatter.nvim",
    cmd = "Format",
    config = [[require("plugin-config.formatter")]]
  }

  -- Tag 展示插件，目前主要使用lsp提供，CTAG也依然好用
  use {
    "liuchengxu/vista.vim",
    event = {"BufRead", "BufNewFile"},
    config = [[require("plugin-config.vista")]]
  }

  -- lang Prettier 用来格式化js ts文件，formatter 配置为默认使用项目下
  -- Prettier,这个是全局的
  use {"prettier/vim-prettier", run = "yarn install", cmd = "Prettier"}

  -- editorconfig
  -- 编辑器配置，个大编辑器都有实现或者有插件，用来统一项目的编辑格式，比如锁进等文件规范
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

  -- emmei插件 使用 ,, 触发补全，
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

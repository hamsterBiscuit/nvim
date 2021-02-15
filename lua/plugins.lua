local packer = nil
local function init()
  local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.api.nvim_command("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  end
  if packer == nil then
    packer = require("packer")
    packer.init(
      {
        git = {
          clone_timeout = nil
        },
        disable_commands = true
      }
    )
  end
  local use = packer.use
  packer.reset()

  -- plugins manger
  use {"wbthomason/packer.nvim", opt = true}
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
  -- use {"rhysd/accelerated-jk"}
  -- gc gcc 注释插件
  use {
    "tyru/caw.vim",
    keys = {"gc", "gcc"},
    config = function()
      vim.cmd [[
      function! InitCaw() abort
        if !&l:modifiable
          silent! nunmap <buffer> gc
          silent! xunmap <buffer> gc
          silent! nunmap <buffer> gcc
          silent! xunmap <buffer> gcc
        else
          nmap <buffer> gc <Plug>(caw:prefix)
          xmap <buffer> gc <Plug>(caw:prefix)
          nmap <buffer> gcc <Plug>(caw:hatpos:toggle)
          xmap <buffer> gcc <Plug>(caw:hatpos:toggle)
        endif
      endfunction
      autocmd FileType * call InitCaw()
      call InitCaw()
    ]]
    end,
    requires = {
      "Shougo/context_filetype.vim",
      config = function()
        vim.g["context_filetype#search_offset"] = 2000
      end
    }
  }
  -- f t 增强
  use {"justinmk/vim-sneak", keys = {{"n", "s"}}}
  -- 平滑滚动插件 半屏或者整屏翻页变为滚动效果
  use {"psliwka/vim-smoothie", event = {"BufReadPre *", "BufNewFile *"}}
  -- 增删改引号
  use {
    "rhysd/vim-operator-surround",
    requires = {"kana/vim-operator-user"},
    config = function()
      vim.api.nvim_set_keymap("v", "sa", "<Plug>(operator-surround-append)", {silent = true})
      vim.api.nvim_set_keymap("v", "sd", "<Plug>(operator-surround-delete)", {silent = true})
      vim.api.nvim_set_keymap("v", "sr", "<Plug>(operator-surround-replace)", {silent = true})
    end,
    keys = {{"v", "sa"}, {"v", "sr"}, {"v", "sd"}}
  }
  -- 任务 异步run term 插件
  use {"skywind3000/asyncrun.extra"}
  use {"skywind3000/vim-terminal-help"}
  use {
    "skywind3000/asynctasks.vim",
    cmd = {"AsyncTask", "AsyncTaskMacro", "AsyncTaskList", "AsyncTaskEdit"},
    config = function()
      vim.g.asynctasks_term_pos = "termhelp"
    end,
    requires = {
      {
        "skywind3000/asyncrun.vim",
        cmd = {"AsyncRun", "AsyncStop"},
        config = function()
          vim.g.asyncrun_open = 6
          vim.g.asyncrun_mode = "term"
        end
      }
    }
  }
  -- 缩进线插件
  use {
    "glepnir/indent-guides.nvim",
    event = {"BufReadPre *", "BufNewFile *"},
    config = function()
      require("indent_guides").setup {
        even_colors = {fg = "NONE", bg = "#23272e"},
        odd_colors = {fg = "NONE", bg = "#23272e"}
      }
    end
  }
  -- 当前光标下划线 高亮
  use {
    "itchyny/vim-cursorword",
    event = {"BufReadPre *", "BufNewFile *"},
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
      {"nvim-lua/popup.nvim"},
      {"nvim-lua/plenary.nvim", opt = true}
    },
    config = [[require("plugin-config.telescope")]]
  }

  -- 高亮 主题
  use {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead *",
    requires = {
      {"nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter"}
    },
    config = [[require("plugin-config.treesitter")]]
  }

  -- 文件管理
  use {
    "kyazdani42/nvim-tree.lua",
    config = [[require("plugin-config.nvim-tree")]]
  }

  -- 补全
  use {
    "neovim/nvim-lspconfig",
    event = "BufRead *",
    config = [[require("plugin-config.lsp")]]
  }
  use {
    "glepnir/lspsaga.nvim",
    cmd = "Lspsaga",
    config = function()
      require "lspsaga".init_lsp_saga()
    end
  }
  use {
    "hrsh7th/nvim-compe",
    event = "InsertEnter *",
    config = [[require("plugin-config.nvim-compe")]],
    requires = {
      {
        "hrsh7th/vim-vsnip",
        event = "InsertCharPre *",
        requires = {
          {"dsznajder/vscode-es7-javascript-react-snippets"},
          {"xabikos/vscode-javascript"},
          {"hollowtree/vscode-vue-snippets"}
        },
        config = function()
          vim.g.vsnip_filetypes = {}
          vim.g.vsnip_filetypes.javascriptreact = {"javascript"}
          vim.g.vsnip_filetypes.vue = {"vue", "javascript", "typescript"}
          vim.g.vsnip_filetypes.typescriptreact = {"typescript"}
        end
      },
      {"hrsh7th/vim-vsnip-integ", event = "InsertCharPre *"}
    }
  }

  -- git信息展示 :SignifyDiff
  use {
    "lewis6991/gitsigns.nvim",
    event = {"BufReadPre *", "BufNewFile *"},
    config = function()
      vim.cmd [[packadd plenary.nvim]]
      require("gitsigns").setup()
    end,
    requires = {
      "nvim-lua/plenary.nvim",
      opt = true
    }
  }
  use {
    "f-person/git-blame.nvim",
    event = {"BufReadPre *", "BufNewFile *"}
  }

  -- 自动括号括回
  use {
    "Raimondi/delimitMate",
    event = {"BufReadPre *", "BufNewFile *"},
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
    event = {"BufReadPre *", "BufNewFile *"},
    config = [[require("plugin-config.vista")]]
  }

  -- lang Prettier 用来格式化js ts文件，formatter 配置为默认使用项目下
  -- Prettier,这个是全局的
  use {"prettier/vim-prettier", run = "yarn install", cmd = "Prettier"}

  -- editorconfig
  -- 编辑器配置，个大编辑器都有实现或者有插件，用来统一项目的编辑格式，比如锁进等文件规范
  use "editorconfig/editorconfig-vim"

  -- 同步预览MD文件 :MarkdownPreview
  -- use {"iamcco/markdown-preview.nvim", run = "cd app && yarn install"}
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
    "posva/vim-vue",
    ft = "vue",
    config = function()
      vim.g.vue_pre_processors = "detect_on_enter"
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

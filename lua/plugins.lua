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
    use {
      'akinsho/nvim-bufferline.lua',
      config = function()
        require'bufferline'.setup {
          options = {
            mappings = true,
            always_show_bufferline = false,
          }
        }
      end
    }
    use {'glepnir/galaxyline.nvim', config = function() require('eviline') end}

    -- 开屏
    use {
      'glepnir/dashboard-nvim',
      config = function()
        vim.g.dashboard_default_header = 'commicgirl10'
        vim.g.dashboard_default_executive ='telescope'
        vim.g.dashboard_custom_section = {
          find_history = {
            description = {'  Recently opened files                   SPC f h'},
            command = 'DashboardFindHistory'
          },
          find_file = {
            description = {'  Find  File                              SPC f f'},
            command = 'DashboardFindFile'
          },
          new_file = {
            description= {'  New   File                              SPC t f'},
            command= 'DashboardNewFile'
          },
          find_word = {
            description= {'  Find  word                              SPC f w'},
            command= 'DashboardFindWord'
          },
        }
      end
    }

    -- 操作视觉增强
    use {'rhysd/accelerated-jk', keys = {'j', 'k'}}
    use {'hrsh7th/vim-eft', keys = 'f'}
    use {'tyru/caw.vim', keys = 'gcc'}
    use 'kana/vim-operator-user'
    use 'rhysd/vim-operator-surround'
    use {
      'glepnir/indent-guides.nvim',
      event = 'BufReadPre *',
      config = function()
        require('indent_guides').setup{
          exclude_filetypes = {'help','dashboard','dashpreview','LuaTree','vista','sagahover'};
        }
      end
    }
    use {
      'itchyny/vim-cursorword',
      event = {'BufReadPre *','BufNewFile *'},
      config = function()
        vim.api.nvim_command('augroup user_plugin_cursorword')
        vim.api.nvim_command('autocmd!')
        vim.api.nvim_command('autocmd FileType defx,denite,fern,clap,vista let b:cursorword = 0')
        vim.api.nvim_command('autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif')
        vim.api.nvim_command('autocmd InsertEnter * let b:cursorword = 0')
        vim.api.nvim_command('autocmd InsertLeave * let b:cursorword = 1')
        vim.api.nvim_command('augroup END')
      end
    }

    -- 颜色荧光笔
    use {
      'norcalli/nvim-colorizer.lua',
      config = function() require'colorizer'.setup() end,
      ft = {'html', 'css', 'sass', 'scss', 'vim', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'lua'}
    }

    -- fuzzyfind 模糊搜索
    use {
      'nvim-telescope/telescope.nvim',
      cmd = 'Telescope',
      requires = {
        {'nvim-telescope/telescope-fzy-native.nvim'},
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'},
      },
      config = function()
        require('telescope').setup {
          extensions = {
            fzy_native = {
              override_generic_sorter = false,
              override_file_sorter = true,
            }
          }
        }
        require('telescope').load_extension('fzy_native')
      end
    }

    -- 高亮
    use {
      'glepnir/zephyr-nvim',
      config = function()
        require('zephyr')
        local syntax = require 'zephyr'.get_zephyr_color()
        vim.api.nvim_command('highlight htmlTagName gui=bold guifg=' .. syntax.orange .. ' guibg=NONE cterm=bold')
        vim.api.nvim_command('highlight htmlArg gui=NONE guifg=' .. syntax.blue .. ' guibg=NONE cterm=bold')
        vim.api.nvim_command('highlight htmlTag gui=NONE guifg=' .. syntax.blue .. ' guibg=NONE cterm=bold')
      end
    }
    use {
      'nvim-treesitter/nvim-treesitter',
      requires = {{'nvim-treesitter/nvim-treesitter-textobjects'}},
      config = function()
        vim.api.nvim_command('set foldmethod=expr')
        vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
        require'nvim-treesitter.configs'.setup {
          ensure_installed = "all",
          highlight = {
            enable = true,
          },
          indent = {
            enable = true,
          },
          textobjects = {
            select = {
              enable = true,
              keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
              },
            },
          },
        }
      end
    }

    -- 文件管理
    use {
      'kyazdani42/nvim-tree.lua',
      config = function()
        vim.g.nvim_tree_hide_dotfiles = 1
        vim.g.nvim_tree_indent_markers = 1
        vim.g.nvim_tree_bindings = {
          edit =            {'<CR>', 'l'},
          edit_vsplit=     's',
          edit_split=      'i',
        }
        vim.g.nvim_tree_icons = {
          default= '',
          symlink= '',
          git= {
            unstaged= "✚",
            staged= "✚",
            unmerged= "≠",
            renamed= "≫",
            untracked= "★"
          },
        }
      end
    }

    -- 补全
    use 'neovim/nvim-lspconfig'
    use {
      'nvim-lua/completion-nvim',
      requires = {
        {'steelsojka/completion-buffers'},
        {'hrsh7th/vim-vsnip', event = 'InsertCharPre *'},
        {'hrsh7th/vim-vsnip-integ', event = 'InsertCharPre *'},
      }
    }

    -- git
    use {
      'mhinz/vim-signify',
      event = {'BufReadPre *','BufNewFile *'},
      config = function()
        vim.g.signify_sign_add = '▋'
        vim.g.signify_sign_change = '▋'
        vim.g.signify_sign_delete = '▋'
        vim.g.signify_sign_delete_first_line = '▘'
        vim.g.signify_sign_show_count = 0
      end
    }

    use {
      'Raimondi/delimitMate',
      event = 'InsertCharPre *',
      config = function()
        vim.g.delimitMate_expand_cr = 0
        vim.g.delimitMate_expand_space = 1
        vim.g.delimitMate_smart_quotes = 1
        vim.g.delimitMate_expand_inside_quotes = 0
        vim.api.nvim_command('au FileType markdown let b:delimitMate_nesting_quotes = ["`"]')
      end
    }

    use {
      'ludovicchabant/vim-gutentags',
      config = function()
        vim.g.gutentags_cache_dir = os.getenv("HOME") .. '/.cache/vim/tags'
        vim.g.gutentags_project_root = {'.root', '.git', '.svn','.project','go.mod','.Cargo.toml','tsconfig.js','jsconfig.js'}
        vim.g.gutentags_generate_on_write = 0
        vim.g.gutentags_generate_on_missing = 0
        vim.g.gutentags_generate_on_new = 0
        vim.g.gutentags_exclude_filetypes = { 'defx', 'denite', 'vista', 'magit' }
      end
    }
    use {
      'liuchengxu/vista.vim',
      config = function()
        vim.g.vista_disable_statusline = 1
        vim.g.vista_default_executive = 'ctags'
        vim.g.vista_echo_cursor_strategy = 'scroll'
        vim.g.vista_vimwiki_executive = 'markdown'
        vim.g.vista_executive_for = {
          vimwiki= 'markdown',
          pandoc= 'markdown',
          markdown= 'vim_lsp',
          typescript= 'nvim_lsp',
          typescriptreact= 'nvim_lsp',
          vue= 'nvim_lsp',
          lua= 'nvim_lsp',
        }
      end
    }

    -- lang
    use 'posva/vim-vue'
    use {'prettier/vim-prettier', run = 'yarn install', cmd = 'Prettier'}

    use {'Shougo/context_filetype.vim', event = 'BufReadPre *'}

    use 'editorconfig/editorconfig-vim'

    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', ft = 'markdown'  }
    use {
      'mattn/emmet-vim',
      event = 'InsertEnter *',
      ft = {'html','css','javascript','javascriptreact','vue','typescript','typescriptreact'},
      config = function()
        vim.g.user_emmet_complete_tag = 0
        vim.g.user_emmet_install_global = 0
        vim.g.user_emmet_install_command = 0
        vim.g.user_emmet_mode = 'i'
      end
    }
  end
)

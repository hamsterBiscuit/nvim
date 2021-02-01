  vim.api.nvim_command("set foldmethod=expr")
  vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")
  require "nvim-treesitter.configs".setup {
    ensure_installed = "all",
    highlight = {
      enable = true
    },
    indent = {
      enable = true
    },
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner"
        }
      }
    }
  }

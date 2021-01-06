--  akinsho/nvim-bufferline.lua
require'bufferline'.setup {
  options = {
    mappings = true,
    always_show_bufferline = false,
  }
}

require('eviline')

--  颜色荧光笔
require'colorizer'.setup{}

--  高亮
require('zephyr')
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

require('indent_guides').setup{
  exclude_filetypes = {'help','dashboard','dashpreview','LuaTree','vista','sagahover'};
}

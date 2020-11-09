
lua << EOF
require "colorizer".setup()

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

local on_attach_vim = function(client)
  require'completion'.on_attach(client)
  require'diagnostic'.on_attach(client)
end
require'nvim_lsp'.vuels.setup{on_attach=on_attach_vim}
EOF

call utils#source_file($VIM_PATH,'module/defx.vim')
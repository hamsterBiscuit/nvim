vim.g.nvim_tree_allow_resize = 1
vim.g.nvim_tree_icons = {
  default = "",
  symlink = ""
}
vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1
}
vim.g.nvim_tree_git_gl = 0
vim.cmd[[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]]

local tree_cb = require("nvim-tree.config").nvim_tree_callback
require("nvim-tree").setup {
  update_focused_file = {
    -- update_cwd = true
  },
  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    }
  },
  view = {
    mappings = {
      list = {
        {key = "l", cb = tree_cb("edit")}
      }
    }
  }
}

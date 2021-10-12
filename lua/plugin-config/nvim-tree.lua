vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_allow_resize = 1
vim.g.nvim_tree_icons = {
  default = "",
  symlink = ""
}
vim.g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1
}
vim.g.nvim_tree_gitignore = 0
vim.g.nvim_tree_git_gl = 0

local tree_cb = require("nvim-tree.config").nvim_tree_callback
require("nvim-tree").setup {
  auto_close = true,
  update_focused_file = {
    update_cwd = true
  },
  view = {
    mappings = {
      list = {
        {key = "l", cb = tree_cb("edit")}
      }
    }
  }
}

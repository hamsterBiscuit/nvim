vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_allow_resize = 1
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_bindings = {
  ["l"] = ":lua require'nvim-tree'.on_keypress('edit')<CR>",
  ["s"] = ":lua require'nvim-tree'.on_keypress('vsplit')<CR>",
  ["i"] = ":lua require'nvim-tree'.on_keypress('split')<CR>"
}
vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "✚",
    staged = "✚",
    unmerged = "≠",
    renamed = "≫",
    untracked = "★"
  }
}
require("nvim-tree.events").on_nvim_tree_ready(
  function()
    vim.cmd("NvimTreeRefresh")
  end
)

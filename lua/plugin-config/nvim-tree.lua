  vim.g.nvim_tree_indent_markers = 1
  vim.g.nvim_tree_auto_close = 1
  vim.g.nvim_tree_quit_on_open = 1
  vim.g.nvim_tree_git_hl = 1
  vim.g.nvim_tree_tab_open = 1
  vim.g.nvim_tree_allow_resize = 1
  vim.g.nvim_tree_bindings = {
    edit = {"<CR>", "l"},
    edit_vsplit = "s",
    edit_split = "i"
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

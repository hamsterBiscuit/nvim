return function()
  vim.g.gutentags_cache_dir = os.getenv("HOME") .. "/.cache/vim/tags"
  vim.g.gutentags_project_root = {
    ".root",
    ".git",
    ".svn",
    ".project",
    "go.mod",
    ".Cargo.toml",
    "tsconfig.js",
    "jsconfig.js"
  }
  vim.g.gutentags_generate_on_write = 0
  vim.g.gutentags_generate_on_missing = 0
  vim.g.gutentags_generate_on_new = 0
  vim.g.gutentags_exclude_filetypes = {"defx", "denite", "vista", "magit"}
end

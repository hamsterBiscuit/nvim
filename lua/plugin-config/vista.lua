return function()
  vim.g.vista_disable_statusline = 1
  vim.g.vista_default_executive = "ctags"
  vim.g.vista_echo_cursor_strategy = "scroll"
  vim.g.vista_vimwiki_executive = "markdown"
  vim.g.vista_executive_for = {
    vimwiki = "markdown",
    pandoc = "markdown",
    markdown = "vim_lsp",
    typescript = "nvim_lsp",
    typescriptreact = "nvim_lsp",
    vue = "nvim_lsp",
    lua = "nvim_lsp"
  }
end

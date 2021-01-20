return function()
  vim.g.vista_disable_statusline = 1
  vim.g.vista_default_executive = "nvim_lsp"
  vim.g.vista_echo_cursor_strategy = "scroll"
  vim.g.vista_vimwiki_executive = "markdown"
  vim.g.vista_executive_for = {
    vimwiki = "markdown",
    pandoc = "markdown",
  }
end

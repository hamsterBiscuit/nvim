require("compe").setup {
  enabled = true,
  debug = false,
  min_length = 1,
  source = {
    path = true,
    buffer = true,
    calc = true,
    vsnip = true,
    nvim_lsp = true,
    spell = true,
    tags = true,
    nvim_lua = true,
    tabnine = true,
    vim_dadbod_completion = true
  }
}

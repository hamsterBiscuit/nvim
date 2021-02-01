  require "compe".setup {
    enabled = true,
    debug = false,
    min_length = 1,
    preselect = "always",
    allow_prefix_unmatch = false,
    source = {
      path = true,
      buffer = true,
      vsnip = true,
      nvim_lsp = true,
      nvim_lua = true
    }
  }

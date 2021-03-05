vim.cmd [[packadd plenary.nvim]]
require("gitsigns").setup {
  signs = {
    add = {hl = "DiffAdded", text = "▋", numhl = "GitSignsAddNr"},
    change = {hl = "DiffChanged", text = "▋", numhl = "GitSignsChangeNr"},
    delete = {hl = "DiffDeleted", text = "▋", numhl = "GitSignsDeleteNr"},
    topdelete = {hl = "DiffDeleted", text = "▘", numhl = "GitSignsDeleteNr"},
    changedelete = {hl = "DiffChanged", text = "▋", numhl = "GitSignsChangeNr"}
  }
}

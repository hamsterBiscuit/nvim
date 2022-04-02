local options = require "options"

local leader_map = function()
  vim.g.mapleader = " "
  vim.api.nvim_set_keymap("n", " ", "", {noremap = true})
  vim.api.nvim_set_keymap("x", " ", "", {noremap = true})
end

local load_core = function()
  leader_map()

  options:load_options()
  require("mapping")

  vim.cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
  vim.cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
  vim.cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
  vim.cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
  vim.cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]
end

load_core()

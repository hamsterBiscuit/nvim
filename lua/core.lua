local options = require "options"

local disable_distribution_plugins = function()
  vim.g.loaded_gzip = 1
  vim.g.loaded_tar = 1
  vim.g.loaded_tarPlugin = 1
  vim.g.loaded_zip = 1
  vim.g.loaded_zipPlugin = 1
  vim.g.loaded_getscript = 1
  vim.g.loaded_getscriptPlugin = 1
  vim.g.loaded_vimball = 1
  vim.g.loaded_vimballPlugin = 1
  vim.g.loaded_matchit = 1
  vim.g.loaded_matchparen = 1
  vim.g.loaded_2html_plugin = 1
  vim.g.loaded_logiPat = 1
  vim.g.loaded_rrhelper = 1
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
  vim.g.loaded_netrwSettings = 1
  vim.g.loaded_netrwFileHandlers = 1
end

local leader_map = function()
  vim.g.mapleader = " "
  vim.api.nvim_set_keymap("n", " ", "", {noremap = true})
  vim.api.nvim_set_keymap("x", " ", "", {noremap = true})
end

local load_core = function()
  disable_distribution_plugins()
  leader_map()

  options:load_options()
  require("mapping")

  -- if vim.fn.filereadable(vim.fn.stdpath("data") .. "/site/lua/_compiled.lua") == 1 then
  --   require("_compiled")
  -- end

  vim.cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
  vim.cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
  vim.cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
  vim.cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
  vim.cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]
  -- vim.cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').magic_compile()]]
end

load_core()

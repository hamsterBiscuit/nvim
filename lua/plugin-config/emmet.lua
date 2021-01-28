return function()
  vim.g.user_emmet_complete_tag = 0
  vim.g.user_emmet_install_global = 0
  vim.g.user_emmet_install_command = 0
  vim.g.user_emmet_mode = "i"
  vim.g.user_emmet_leader_key = ","
  vim.api.nvim_command([[autocmd FileType html,css,javascript,javascriptreact,vue,typescript,typescriptreact EmmetInstall]])
end

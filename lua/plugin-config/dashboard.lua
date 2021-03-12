vim.g.dashboard_footer_icon = "🐬 "
vim.g.dashboard_preview_command = "cat"
vim.g.dashboard_preview_pipeline = "lolcat"
vim.g.dashboard_preview_file_height = 12
vim.g.dashboard_preview_file = "~/.config/nvim/static/neovim.cat"
vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_preview_file_width = 80
vim.g.dashboard_custom_section = {
  find_history = {
    description = {"  Recently opened files                   SPC f h"},
    command = "DashboardFindHistory"
  },
  find_file = {
    description = {"  Find  File                              SPC f f"},
    command = "DashboardFindFile"
  },
  new_file = {
    description = {"  New   File                              SPC t f"},
    command = "DashboardNewFile"
  }
}

vim.cmd [[packadd vim-dadbod]]
vim.g.db_ui_show_help = 0
vim.g.db_ui_win_position = "left"
vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_winwidth = 35
vim.g.db_ui_save_location = os.getenv("HOME") .. "/.cache/vim/db_ui_queries"
vim.g.dbs = {
  dev = "mysql://root@172.16.2.226/suyi_cinema"
}

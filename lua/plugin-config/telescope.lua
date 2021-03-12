vim.cmd [[packadd plenary.nvim]]
vim.cmd [[packadd popup.nvim]]
require("telescope").setup {
  defaults = {
    prompt_position = "top",
    sorting_strategy = "ascending",
    prompt_prefix = "🔭 ",
    results_width = 0.6,
    file_previewer = require "telescope.previewers".vim_buffer_cat.new,
    grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
    qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
    mappings = {
      i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous
      }
    }
  }
}

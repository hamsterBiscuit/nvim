vim.cmd [[packadd plenary.nvim]]
require("telescope").setup {
  defaults = {
    prompt_position = "top",
    sorting_strategy = "ascending",
    prompt_prefix = "🤖",
    mappings = {
      i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous
      }
    }
  }
}

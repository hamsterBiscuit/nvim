return function()
  require("telescope").setup {
    defaults = {
      prompt_position = "top",
      sorting_strategy = "ascending",
      prompt_prefix="🔍",
      mappings = {
        i = {
          ['<C-j>'] = require('telescope.actions').move_selection_next,
          ['<C-k>'] = require('telescope.actions').move_selection_previous
        }
      }
    },
    extensions = {
      fzf_writer = {
        minimum_grep_characters = 1,
        minimum_files_characters = 1,
        -- Disabled by default.
        -- Will probably slow down some aspects of the sorter, but can make color highlights.
        -- I will work on this more later.
        use_highlighter = true
      }
    }
  }
end

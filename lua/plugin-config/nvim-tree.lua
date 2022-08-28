vim.g.nvim_tree_allow_resize = 1

local tree_cb = require("nvim-tree.config").nvim_tree_callback
require("nvim-tree").setup {
  disable_netrw = false,
  hijack_cursor = true,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  update_cwd = true,
  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  "
      }
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = ""
        },
        git = {
          deleted = "",
          ignored = "",
          renamed = "",
          staged = "",
          unmerged = "",
          unstaged = "",
          untracked = "ﲉ"
        }
      }
    },
    special_files = {"Cargo.toml", "Makefile", "README.md", "readme.md"}
  },
  view = {
    width = 30,
    height = 30,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    hide_root_folder = false,
    mappings = {
      list = {
        {key = "l", cb = tree_cb("edit")},
        {key = {"s"}, action = "split"},
        {key = {"v"}, action = "vsplit"}
      }
    }
  },
  hijack_directories = {
    enable = true,
    auto_open = true
  },
  ignore_ft_on_setup = {},
  filters = {
    dotfiles = false,
    custom = {".DS_Store"},
    exclude = {}
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = {"notify", "packer", "qf", "diff", "fugitive", "fugitiveblame"},
          buftype = {"nofile", "terminal", "help"}
        }
      }
    }
  }
}

vim.api.nvim_create_autocmd(
  "BufEnter",
  {
    group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
    pattern = "NvimTree_*",
    callback = function()
      local layout = vim.api.nvim_call_function("winlayout", {})
      if
        layout[1] == "leaf" and
          vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and
          layout[3] == nil
       then
        vim.cmd("confirm quit")
      end
    end
  }
)

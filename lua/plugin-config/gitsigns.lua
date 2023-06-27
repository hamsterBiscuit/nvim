-- vim.cmd [[packadd plenary.nvim]]
require("gitsigns").setup {
  on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function gitsignsMap(mode, l, r, opts)
			opts = opts or { noremap = true, silent = true }
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		gitsignsMap("n", "<leader>j", ":Gitsigns next_hunk<CR>")
		gitsignsMap("n", "<leader>k", ":Gitsigns prev_hunk<CR>")
		-- Actions

		gitsignsMap({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
		gitsignsMap({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
		gitsignsMap("n", "<leader>hS", gs.stage_buffer)
		gitsignsMap("n", "<leader>hu", gs.undo_stage_hunk)
		gitsignsMap("n", "<leader>hR", gs.reset_buffer)
		gitsignsMap("n", "<leader>hp", gs.preview_hunk)
		gitsignsMap("n", "<leader>hb", function()
			gs.blame_line({ full = true })
		end)
		gitsignsMap("n", "<leader>tb", gs.toggle_current_line_blame)
		gitsignsMap("n", "<leader>hd", gs.diffthis)
		gitsignsMap("n", "<leader>hD", function()
			gs.diffthis("~")
		end)
		gitsignsMap("n", "<leader>td", gs.toggle_deleted)

		-- Text object
		gitsignsMap({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
	end,
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 100,
    virt_text_pos = "eol"
  }
}

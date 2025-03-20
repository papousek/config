return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			view = {
				width = 80,
				relativenumber = true,
			},
			-- change folder arrow icons
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "", -- arrow when folder is closed
							arrow_open = "", -- arrow when folder is open
						},
					},
				},
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
		})

		-- set keymaps
		local keymap = vim.keymap -- for conciseness
		keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>") -- open/close
		keymap.set("n", "<leader>f", ":NvimTreeRefresh<CR>") -- refresh
		keymap.set("n", "<leader>n", ":NvimTreeFindFile<CR>") -- search file

		keymap.set("n", "<C-p>", ":Telescope find_files<CR>", { desc = "Telescope find files" })
		keymap.set("n", "<C-g>", ":Telescope live_grep<CR>", { desc = "Telescope live grep" })
		keymap.set("n", "<C-b>", ":Telescope buffers<CR>", { desc = "Telescope buffers" })
		keymap.set("n", "<leader>fh", ":Telescope help_tags", { desc = "Telescope help tags" })
	end,
}

return {
	"folke/trouble.nvim",
	config = function()
		require("trouble").setup({
			win = {
				position = "right",
				size = 0.4,
			},
			preview = {
				type = "split",
				relative = "win",
				position = "bottom",
				size = 0.5,
			},
		})
	end,
	opts = {}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>xX",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>cl",
			"<cmd>Trouble lsp toggle win.position=right focus=true<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
	},
}

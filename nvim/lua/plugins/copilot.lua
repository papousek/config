return {
	{
		"zbirenbaum/copilot.lua",
		lazy = true,
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		lazy = true,
		config = function()
			require("copilot_cmp").setup({})
		end,
	},
}

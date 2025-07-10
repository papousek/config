return {
	{
		"neovim/nvim-lspconfig",
		-- Load lspconfig first
	},
	{
		"williamboman/mason.nvim",
		config = function()
			local mason = require("mason")
			mason.setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup({
				ensure_installed = {
					"html",
					"pyright",
					"lua_ls",
				},
				automatic_installation = true,
			})
		end,
	},
}

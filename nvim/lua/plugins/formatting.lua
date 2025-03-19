return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "black", stop_after_first = false },
				-- Conform will run the first available formatter
				javascript = { "prettierd", "prettier", stop_after_first = true },
				yaml = { "prettierd", "prettier", stop_after_first = true },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 1000,
				lsp_format = "fallback",
				async = false,
			},
		})
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end)
	end,
}

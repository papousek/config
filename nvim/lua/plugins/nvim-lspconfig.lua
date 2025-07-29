-----------------------------------------------------------
-- Neovim LSP configuration file
-----------------------------------------------------------

-- Plugin: nvim-lspconfig
-- url: https://github.com/neovim/nvim-lspconfig

-- For configuration see the Wiki: https://github.com/neovim/nvim-lspconfig/wiki
-- Autocompletion settings of "nvim-cmp" are defined in plugins/nvim-cmp.lua

return {
	"neovim/nvim-lspconfig",
	config = function()
		lspconfig = require("lspconfig")
		-- Diagnostic settings:
		-- see: `:help vim.diagnostic.config`
		-- Customizing how diagnostics are displayed
		vim.diagnostic.config({
			update_in_insert = true,
			virtual_text = false,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})

		-- Show line diagnostics automatically in hover window
		vim.cmd([[
      autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false })
    ]])

		-- Mappings.
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

		--[[
    Language servers setup:

    For language servers list see:
    https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

    Language server installed:

    Bash          -> bashls
    Python        -> pyright
    C-C++         -> clangd
    HTML/CSS/JSON -> vscode-html-languageserver
    JavaScript/TypeScript -> ts_ls
    --]]

		-- Define `root_dir` when needed
		-- See: https://github.com/neovim/nvim-lspconfig/issues/320
		-- This is a workaround, maybe not work with some servers.
		-- local root_dir = function()
		-- 	return vim.fn.getcwd()
		-- end
		local root_dir = lspconfig.util.root_pattern(".git", "setup.py", "pyproject.toml", "requirements.txt")

		lspconfig.pyright.setup({
			on_attach = function(client, bufnr)
				-- Only keep diagnostics and hover
				client.server_capabilities.definitionProvider = false
				client.server_capabilities.declarationProvider = false
				client.server_capabilities.referencesProvider = false
				client.server_capabilities.implementationProvider = false
				client.server_capabilities.typeDefinitionProvider = false
				client.server_capabilities.documentSymbolProvider = false
				client.server_capabilities.workspaceSymbolProvider = false
				client.server_capabilities.callHierarchyProvider = false
			end,
			settings = {
				python = {
					analysis = {
						typeCheckingMode = "basic",
					},
				},
			},
		})

		lspconfig.pylsp.setup({
			settings = {
				pylsp = {
					plugins = {
						pycodestyle = {
							enabled = true,
							maxLineLength = 120,
						},
						pyflakes = {
							enabled = true,
						},
						pylint = {
							enabled = false,
						},
					},
				},
			},
		})
	end,
}

return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		local status_ok, ibl = pcall(require, "ibl")
		if not status_ok then
			return
		end

		ibl.setup({
			indent = { char = "▎" },
			exclude = {
				filetypes = {
					"lspinfo",
					"packer",
					"checkhealth",
					"help",
					"man",
					"dashboard",
					"git",
					"markdown",
					"text",
					"terminal",
					"NvimTree",
				},

				buftypes = {
					"terminal",
					"nofile",
					"quickfix",
					"prompt",
				},
			},
		})
	end,
	main = "ibl",
	opts = {},
}

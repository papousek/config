return {
	"preservim/tagbar",
	config = function()
		-- set keymaps
		vim.keymap.set("n", "<F8>", ":Tagbar<CR>") -- open/close
	end,
}

return {
	"preservim/tagbar",
	config = function()
		-- set keymaps
		vim.keymap.set("n", "<CR>", ":Tagbar<CR>") -- open/close
	end,
}

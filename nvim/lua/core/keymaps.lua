-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ","

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
-- map('', '<up>', '<nop>')
-- map('', '<down>', '<nop>')
-- map('', '<left>', '<nop>')
-- map('', '<right>', '<nop>')

-- Change split orientation
map("n", "<leader>tk", "<C-w>t<C-w>K") -- change vertical to horizontal
map("n", "<leader>th", "<C-w>t<C-w>H") -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Tab navigation
-- map("n", "<C-t>", ":tabnew<CR>")
-- map("i", "<C-t>", "<Esc>:tabnew<CR>")

-- Buffers
map("n", "P", ":b#<CR>")
map("n", "<leader>s", ":vertical sb<CR><C-w>h:b#<CR><C-w>l")

-- Misc
map("n", "<leader>g", ":!git grep <C-r><C-w> *<cr>") -- git grep
map("n", "Q", ":q<CR>") -- save and exit

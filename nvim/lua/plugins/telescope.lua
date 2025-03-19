return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep',
    'sharkdp/fd',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    local telescope = require("telescope")
    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    keymap.set('n', '<C-p>', ':Telescope find_files<CR>', { desc = 'Telescope find files' })
    keymap.set('n', '<C-g>', ':Telescope live_grep<CR>', { desc = 'Telescope live grep' })
    keymap.set('n', '<C-b>', ':Telescope buffers<CR>', { desc = 'Telescope buffers' })
    keymap.set('n', '<leader>fh', ':Telescope help_tags', { desc = 'Telescope help tags' })
  end
}

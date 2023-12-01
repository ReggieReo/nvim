return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        vim.g.mapleader = " "
        local builtin = require('telescope.builtin')

        local opts = { noremap = true, silent = true }
        local keymap = vim.keymap.set

        keymap('n', '<leader>pf', builtin.find_files, opts)
        -- keymap('n', '<leader>b', builtin.buffers, opts)
        keymap('n', '<C-p>', builtin.git_files, opts)
        keymap('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
    end
}

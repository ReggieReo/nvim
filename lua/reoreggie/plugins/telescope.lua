return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.8",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        local focus_preview = function(prompt_bufnr)
            local action_state = require("telescope.actions.state")
            local picker = action_state.get_current_picker(prompt_bufnr)
            local prompt_win = picker.prompt_win
            local previewer = picker.previewer
            local winid = previewer.state.winid
            local bufnr = previewer.state.bufnr
            vim.keymap.set("n", "<M-1>", function()
                vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", prompt_win))
            end, { buffer = bufnr })
            vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", winid))
            -- api.nvim_set_current_win(winid)
        end
        require('telescope').setup({
            mappings = {
                n = {
                    ["<M-1>"] = focus_preview,
                }
            }
        })

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    end
}

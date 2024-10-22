return {
    "crispgm/nvim-go",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
        -- setup nvim-go
        require('go').setup({})

        -- setup lsp client
        require('lspconfig').gopls.setup({})
    end
}

return {"tpope/vim-fugitive",
      config = function()
	      vim.g.mapleader = " "
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

      end
}

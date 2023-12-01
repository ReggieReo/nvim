return {"mbbill/undotree",
    config = function () 
	      vim.g.mapleader = " "
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
end}

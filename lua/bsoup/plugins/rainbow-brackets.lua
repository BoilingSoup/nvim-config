vim.api.nvim_create_augroup("rainbow", {
	clear = true,
})

vim.api.nvim_create_autocmd({ "Filetype" }, {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "rainbowcol1", {
			bold = false,
			fg = "#FF0000",
		})
	end,
	group = "rainbow",
})

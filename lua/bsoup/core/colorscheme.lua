local status, _ = pcall(vim.cmd, "colorscheme fruitypebbles")
if not status then
	return
end

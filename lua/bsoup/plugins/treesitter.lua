-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

local ft_to_parser_status, ft_to_parser = pcall(require, "nvim-treesitter.parsers")
if not ft_to_parser_status then
	return
end

-- highlight these like html
ft_to_parser.filetype_to_parsername.blade = "html" -- blade.php
ft_to_parser.filetype_to_parsername.template = "html" -- .tmpl

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	rainbow = {
		enable = true,
		disable = { "jsx", "tsx" },
		extended_mode = false,
		max_file_lines = nil,
		colors = {
			"#FF0000",
			"#FFFF00",
			"#F5BA18",
			"#1100AB",
		},
	},
	-- enable indentation
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"svelte",
		"graphql",
		"bash",
		"lua",
		"vim",
		"dockerfile",
		-- "gitignore",
		"go",
		"dockerfile",
		"c",
		"cpp",
		"bash",
		"php",
		"python",
		"yaml",
	},
	-- auto install above language parsers
	auto_install = true,
})

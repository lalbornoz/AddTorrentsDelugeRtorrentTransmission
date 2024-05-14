lua << EOF
lazy_plugins["nvim-tree.lua"] = {
config = function()
	-- disable netrw at the very start of your init.lua
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1

	-- set termguicolors to enable highlight groups
	vim.opt.termguicolors = true

	-- empty setup using defaults
	require("nvim-tree").setup()

	-- OR setup with some options
	require("nvim-tree").setup({
		filters = {
			dotfiles = true,
		},

		renderer = {
			group_empty = true,
		},

		sort_by = "case_sensitive",

		view = {
			side = "right",
			width = 30,
		},
	})
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0

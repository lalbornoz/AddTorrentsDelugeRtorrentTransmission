lua << EOF
lazy_plugins["neodev.nvim"] = {
config = function()
	require("neodev").setup({
		library = { plugins = { "nvim-dap-ui" }, types = true },
	})
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0

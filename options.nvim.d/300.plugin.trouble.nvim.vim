lua << EOF
lazy_plugins["trouble.nvim"] = {
config = function()
	require("trouble").setup()
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0

lua << EOF
lazy_plugins["mason.nvim"] = {
config = function()
	require("mason").setup()
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0

lua << EOF
lazy_plugins["neo-tree.nvim"] = {
config = function()
	require('neo-tree').setup {
	}
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0

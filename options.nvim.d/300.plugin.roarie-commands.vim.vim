lua << EOF
lazy_plugins["roarie-commands.vim"] = {
config = function()
	require("roarie-menu").setup({})
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0

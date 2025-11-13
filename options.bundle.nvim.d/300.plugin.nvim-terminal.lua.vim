lua << EOF
lazy_plugins["nvim-terminal.lua"] = {
config = function()
	require'terminal'.setup()
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0

lua << EOF
lazy_plugins["nvim-spectre"] = {
config = function()
	-- <https://github.com/nvim-pack/nvim-spectre#customization>
	require('spectre').setup({
})
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0

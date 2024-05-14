lua << EOF
lazy_plugins["gruvbox-baby"] = {
config = function()
	vim.cmd [[
		" Disable telescope theme since it's broken
		let g:gruvbox_baby_telescope_theme = 0

		" Disable transparent mode
		let g:gruvbox_baby_transparent_mode = 0

		" Load the colorscheme
		colorscheme gruvbox-baby
	]]
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0

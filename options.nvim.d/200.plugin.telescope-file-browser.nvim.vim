lua << EOF
lazy_plugins["telescope-file-browser.nvim"] = {
config = function()
	local telescope = require("telescope")

	telescope.load_extension "file_browser"
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0

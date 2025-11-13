lua << EOF
lazy_plugins["telescope-ui-select.nvim"] = {
config = function()
	-- To get ui-select loaded and working with telescope, you need to call
	-- load_extension, somewhere after setup function:
	require("telescope").load_extension("ui-select")
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0

lua << EOF
lazy_plugins["nvim-dap-ui"] = {
config = function()
	require("dapui").setup()
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0

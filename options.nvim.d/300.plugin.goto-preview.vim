lua << EOF
lazy_plugins["goto-preview"] = {
config = function()
	require('goto-preview').setup {
		dismiss_on_move = true;
		focus_on_open = false;
	}
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0

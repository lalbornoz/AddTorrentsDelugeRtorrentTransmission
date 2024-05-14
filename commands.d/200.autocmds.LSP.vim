"
" [AutoCmds] Plugins: LSP
"

"
" If $PYLSP_DEBUG is set in the environment , log LSP server output
" verbosively to $HOME/.vim/lsp.log to aid LSP debugging.
if has_key(environ(), "PYLSP_DEBUG") && executable('pyls')
	function Pylsp_debug_set()
		let g:lsp_log_file = expand('$HOME/.vim/lsp.log')
		let g:lsp_log_verbose = 1
		au User lsp_setup call lsp#register_server({
			\ 'name':	'pyls',
			\ 'cmd':	{server_info->['pyls', '--verbose', '--log-file', expand('$HOME/.vim/pyls.log')]},
			\ 'whitelist':	['python'],
			\ })
	endfunction
	silent autocmd FileType python call Pylsp_debug_set()
endif

if executable('rust-analyzer')
	au User lsp_setup call lsp#register_server({
		\ 'name': 'Rust Language Server',
		\ 'cmd': {server_info->['rust-analyzer']},
		\ 'whitelist': ['rust'],
		\ })
endif

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0

let g:lsp_diagnostics_echo_cursor = 1		" Echo of diagnostic error for current line to status
let g:lsp_settings = {
	\ 'clangd': {
	\	'cmd': ['clangd', '--background-index', '--pch-storage=memory']
	\ }
	\ }

if executable('clangd')
	augroup lsp_clangd
		autocmd!
		autocmd User lsp_setup call lsp#register_server({
			\ 'name': 'clangd',
			\ 'cmd': {server_info->['clangd']},
			\ 'whitelist': ['c', 'cpp', 'h'],
			\ })
		autocmd FileType c	setlocal omnifunc=lsp#complete
		autocmd FileType cpp	setlocal omnifunc=lsp#complete
		autocmd FileType h	setlocal omnifunc=lsp#complete
	augroup end
endif

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0

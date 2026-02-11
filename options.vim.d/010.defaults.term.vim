"
" [Options] Defaults (terminal)
"

"
" Enable 24-bit colours in non-GUI {screen,tmux} sessions
"
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0

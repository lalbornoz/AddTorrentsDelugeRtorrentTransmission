"
" [Options] Feature-dependent: folding, statusline, syntax
"

if has("folding")	| set foldmethod=marker commentstring=/*\ %s\ */	| endif
if has("statusline")	| set ruler | set rulerformat=%15(%l,%c%V\ %P%)		| endif
if !has("nvim")
if has("syntax")	| syntax on | colors gruvbox | set background=dark	| endif
endif

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0

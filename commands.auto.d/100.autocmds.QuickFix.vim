"
" [AutoCmds] QuickFix*
"

autocmd QuickFixCmdPost	[^l]* nested	cwindow | wincmd p
autocmd QuickFixCmdPost	   l* nested	lwindow | wincmd p

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0

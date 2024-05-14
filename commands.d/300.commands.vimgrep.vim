"
" [Commands] vimgrep
"

command! -nargs=+	Cv vimgrep <args> % | wincmd p
command! -nargs=+	Lv lvimgrep <args> % | wincmd p

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0

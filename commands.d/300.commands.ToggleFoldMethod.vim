"
" [autoload] ToggleFoldMethod()
"

fun! ToggleFoldMethod()
	if &foldmethod == "marker"
		set foldmethod=indent
	elseif &foldmethod == "indent"
		set foldmethod=marker
	endif
endfun!
command! -nargs=0 ToggleFoldMethod call ToggleFoldMethod()

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0

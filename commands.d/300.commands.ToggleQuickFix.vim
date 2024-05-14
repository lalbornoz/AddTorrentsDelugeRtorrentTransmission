"
" [autoload] ToggleQuickFix()
"

fun! ToggleQuickFix()
	if empty(filter(getwininfo(), 'v:val.quickfix'))
		copen
	else
		cclose
	endif
endfun!
command! -nargs=0 ToggleQuickFix call ToggleQuickFix()

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0

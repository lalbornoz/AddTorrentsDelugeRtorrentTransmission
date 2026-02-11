"
" [Function] ReadNewScratch(cmdline, ...): execute cmdline in temporary buffer w/ optional &l:filetype=get(a:,1) and 1G
"

fun! ReadNewScratch(cmdline, ...) abort
	new
	let cursor_pos = getpos('.')
	setlocal bufhidden=wipe buftype=nofile noswapfile
	let filetype = get(a:, 1, "")
	if filetype != ""
		let &l:filetype = get(a:, 1, "")
	endif
	execute '0read!' a:cmdline
	let cursor_pos[1] = 0
	call setpos('.', cursor_pos)
endfun
command! -nargs=+	CReadNewScratch call ReadNewScratch('<args>')

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0

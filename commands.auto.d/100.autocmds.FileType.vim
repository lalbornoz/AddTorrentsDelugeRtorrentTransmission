"
" [AutoCmds] FileType
"

autocmd	FileType	gitcommit	set	textwidth=0
autocmd	FileType	netrw		setl	bufhidden=wipe
autocmd	FileType	perl		syntax	off
autocmd FileType	python		set	expandtab shiftwidth=4 tabstop=4
autocmd FileType 	rust		set	makeprg=cargo\ check
autocmd FileType	rust		set	errorformat=
							\%-G,
							\%-Gerror:\ aborting\ %.%#,
							\%-Gerror:\ Could\ not\ compile\ %.%#,
							\%Eerror:\ %m,
							\%Eerror[E%n]:\ %m,
							\%Wwarning:\ %m,
							\%Inote:\ %m,
							\%C\ %#-->\ %f:%l:%c,
							\%E\ \ left:%m,%C\ right:%m\ %f:%l:%c,%Z

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0

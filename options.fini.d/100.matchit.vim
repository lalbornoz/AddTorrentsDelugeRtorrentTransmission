"
" Load matchit.vim, unless already loaded
"
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
	runtime! macros/matchit.vim
endif

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0

"
" (see <https://github.com/yegappan/lsp/blob/main/doc/configs.md#bash-language-server>)
"

" {{{ C/C++: clangd
if executable('clangd')
	augroup lsp_clangd
		autocmd!
		autocmd BufReadPre *.{c,cc,cpp,cxx,h,hh,hpp,hxx}
			\ call LspAddServer(
				\ [#{name:	'clangd',
				\    filetype:	['c', 'cpp'],
				\    path:	'clangd',
				\    args:	['--background-index', '--clang-tidy']
				\ }]) |
			\
			\ call LspOptionsSet(
				\ #{autoComplete: v:false,
				\   omniComplete: v:true,
				\ })

		autocmd User LspAttached if &filetype =~# 'c\|cpp'	|
			\	setlocal omnifunc=g:LspOmniFunc		|
			\ endif
	augroup end
endif
" }}}
" {{{ Python: pylsp
if executable('pylsp')
	augroup lsp_pylsp
		autocmd!
		autocmd BufReadPre *.py
			\ call LspAddServer(
				\ [#{name:	'pylsp',
				\    filetype:	'python',
				\    path:	'pylsp',
				\    args:	[]
			\ }]) |
			\
			\ call LspOptionsSet(
				\ #{autoComplete: v:false,
				\   omniComplete: v:true,
				\ })

		autocmd User LspAttached if &filetype =~# 'python'	|
			\	setlocal omnifunc=g:LspOmniFunc		|
			\ endif
	augroup end
endif
" }}}

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0

" =============================================================================
" Filename: autoload/lightline/colorscheme/roarie.vim
" Author: roarie
" License: MIT License
" Last Change: 2023/03/04 13:14:41.
" =============================================================================

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ ['#a05463', '#f5a9b8', 'bold'], ['white', '#178ab6'] ]
let s:p.normal.right = [ ['white', '#c27685'], ['white', '#0679a5'], ['gray8', 'gray2'] ]
let s:p.inactive.right = [ ['gray1', 'gray5'], ['gray4', 'gray1'], ['gray4', 'gray0'] ]
let s:p.inactive.left = s:p.inactive.right[1:]
let s:p.insert.left = [ ['#a05463', '#f5a9b8', 'bold'], ['white', 'darkblue'] ]
let s:p.insert.right = [ [ 'white', '#c27685' ], [ 'white', '#0679a5' ], [ 'mediumcyan', 'darkestblue' ] ]
let s:p.replace.left = [ ['brightred', '#f5a9b8', 'bold'], ['white', '#178ab6'] ]
let s:p.visual.left = [ ['white', '#178ab6', 'bold'], ['#a05463', '#f5a9b8'] ]
let s:p.normal.middle = [ [ 'gray7', 'gray2' ] ]
let s:p.insert.middle = [ [ 'mediumcyan', 'darkestblue' ] ]
let s:p.replace.middle = s:p.normal.middle
let s:p.replace.right = s:p.normal.right
let s:p.tabline.left = [ [ 'gray9', 'gray4' ] ]
let s:p.tabline.tabsel = [ [ 'gray9', 'gray1' ] ]
let s:p.tabline.middle = [ [ 'gray2', 'gray8' ] ]
let s:p.tabline.right = [ [ 'gray9', 'gray3' ] ]
let s:p.normal.error = [ [ 'gray9', 'brightestred' ] ]
let s:p.normal.warning = [ [ 'gray1', 'yellow' ] ]

let g:lightline#colorscheme#roarie#palette = lightline#colorscheme#fill(s:p)

let g:lightline = {
	\ 'active': {
	\	'right': [ [ 'lineinfo_full' ],
	\		   [ 'percent' ],
	\		   [ 'case', 'fileformat', 'fileencoding', 'filetype' ] ]
	\ },
	\ 'colorscheme': 'roarie',
	\ 'component': {
	\	'case':			'%{&ignorecase!=#1?"CASE":"cAsE"}',
	\	'lineinfo_full':	'%l,%c%V/%L %P'
	\ },
	\ }

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0

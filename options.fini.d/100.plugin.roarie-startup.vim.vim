" {{{ let g:roarie_startup_hl_groups = [...]
let g:roarie_startup_hl_groups = [
	\ ["Button1",		"gui=bold",		"guifg=black",		"guibg=#7acaca"],
	\ ["Button1",					"ctermfg=black",	"ctermbg=darkcyan"],
	\ ["Button2",		"gui=bold",		"guifg=black",		"guibg=#850c6b"],
	\ ["Button2",					"ctermfg=black",	"ctermbg=darkmagenta"],
	\ ["ButtonIgn1",				"guifg=#7acaca",	"guibg=#7acaca"],
	\ ["ButtonIgn1",				"ctermfg=darkcyan",	"ctermbg=darkcyan"],
	\ ["ButtonIgn2",				"guifg=#850c6b",	"guibg=#850c6b"],
	\ ["ButtonIgn2",				"ctermfg=darkmagenta",	"ctermbg=darkmagenta"],
	\ ["ButtonFrame1",	"gui=bold",		"guifg=#7acaca"],
	\ ["ButtonFrame1",				"ctermfg=darkcyan"],
	\ ["ButtonFrame2",	"gui=bold",		"guifg=#850c6b"],
	\ ["ButtonFrame2",				"ctermfg=darkmagenta"],
	\ ["ButtonRhs1",	"gui=underline",	"guifg=black",		"guibg=#7acaca"],
	\ ["ButtonRhs1",	"cterm=underline",	"ctermfg=black",	"ctermbg=darkcyan"],
	\ ["ButtonRhs2",	"gui=underline",	"guifg=black",		"guibg=#850c6b"],
	\ ["ButtonRhs2",	"cterm=underline",	"ctermfg=black",	"ctermbg=darkmagenta"],
	\ ]
" }}}
" {{{ let g:roarie_startup_hl_matches = [...]
let g:roarie_startup_hl_matches = [
	\ ["Button1",		'\[\zs.*\ze\]'],
	\ ["Button2",		'\]\zs.*\ze\['],
	\ ["ButtonFrame1",	'\[\|\]'],
	\ ["ButtonFrame2",	'\]\|\['],
	\ ["ButtonIgn1",	'\(\zs\[\ze\)\|\(\zs\]\ze\)'],
	\ ["ButtonIgn2",	'\(\zs\]\ze\)\|\(\zs\[\ze\)'],
	\ ["ButtonRhs1",	'\[.*<\zs.*\ze>.*\]'],
	\ ["ButtonRhs2",	'\].*<\zs.*\ze>.*\['],
	\ ]
" }}}

let g:roarie_startup_screen_lines = [
	\ '[󰍜  Mappings menu            <ALT-M>]',
	\ ']  Complete in insert mode  <S-TAB>[',
	\ '[  Peek definition             <F1>]',
	\ ']  Go to definition            <F2>[',
	\ '[󱔁  Search document symbols...  <F3>]',
	\ ']󰋖  Display manual page       <C-F4>[',
	\ '[  Build...                    <F5>]',
	\ ']  Git status                <C-F6>[',
	\ '[  Create new window           <F7>]',
	\ ']󰓩  Open a new tab page         <F8>[',
	\ '[  Close current window/tab  <S-F8>]',
	\ ']  Search in files...         <F10>[',
	\ '[  Open terminal              <F11>]',
	\ ']  Toggle file tree sidebar   <F12>[',
	\ ]

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0

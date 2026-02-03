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
	\ '             [0m[37m              [0m[34m▃▃▃▃[0m',
	\ '             [0m[37m           [0m[34m▟[44m[94m        [0m[34m▙[0m',
	\ '             [0m[35m▟▙▃▟▙      [44m[34m [44m[33m/\    /\ [0m[37m   [0m[97mroar![0m',
	\ '             [0m[35m▜[0m[95m▒▓▒[0m[35m▛      [104m[94m  [103m[94m▛ [103m[33m""" [103m[94m▜[104m[34m [0m[37m  [0m[97m/[0m',
	\ '             [0m[37m [0m[35m▜[45m[35m [0m[35m▛       [104m[94m [103m[30m  ^ _ ^ [104m[94m [0m[37m [0m[97m/[0m',
	\ '             [0m[37m  [0m[35m▀        [46m[36m [103m[33m (__[103m[30my[103m[33m_)[103m[30m [46m[36m [0m',
	\ '             [0m[37m [0m[93m▟▙    ▁▂▃▟[103m[36m▐[0m[36m▙[0m[93m▜[103m[33m`\_/[0m[93m▛[0m[36m▟▌[0m',
	\ '             [0m[37m [0m[93m▟▙   ▟[103m[30m    [103m[36m▓▓▓[103m[30m| |[0m[93m▍[0m[36m▓▓▓[0m',
	\ '  [90m/\/\     _[0m [0m[37m [0m[93m▜[103m[30m\[0m[93m▙ ▟[103m[30m    [103m[36m▓▓▓▓▓[103m[30m |[0m[36m▓▓▓▓▓[0m',
	\ ' [90m/[0mo[90m.[0mo[90m \ -.(([0m [0m[37m  [0m[93m▜[103m[30m\\roa \ [103m[36m▒▒▒[103m[30m|[103m[33m [103m[30m|[0m[37m [0m[36m▒▒▒[0m',
	\ ' [90m\_^__/\  \))[0m[0m[37m   [0m[93m▜[103m[30m\ rie ) [103m[36m▒[103m[30m_|[103m[33m [103m[30m|[0m[93m▙ [0m[36m▒[0m',
	\ ' [90m(_(_,__(_|/[0m [0m[37m   [103m[30m(     /  ))))))[0m',
	\ '[󰍜  Mappings menu            <ALT-M>]',
	\ ']  Complete in insert mode  <S-TAB>[',
	\ '[  Peek definition             <F1>]',
	\ ']  Go to definition            <F2>[',
	\ '[󱔁  Search document symbols...  <F3>]',
	\ ']󰋖  Display manual page       <C-F4>[',
	\ '[  Build...                    <F5>]     [36;46m [0m',
	\ ']  Git status                <C-F6>[    [36;46m   [0m',
	\ '[  Create new window           <F7>]   [36;46m     [0m',
	\ ']󰓩  Open a new tab page         <F8>[  [36;46m [93;103m [30;103m/[93;103m  [0m',
	\ '[  Close current window/tab  <S-F8>] [36;46m [93;103m [30;103m_[30;40m_[30;103m_[30;40m_[30;103m_[0m',
	\ ']  Search in files...         <F10>[[36;46m   [93;103m    [0m',
	\ '[  Open terminal              <F11>][36;46m    [93;103m  [0m [93;103m [0m',
	\ ']  Toggle file tree sidebar   <F12>[[36;46m   [94;44m    [93;103m [0m',
	\ '                                       [36;46m [30;0m [94;44m [97;44mKA[94;44m [0m',
	\ '                                         [94;44m [97;44mDE[94;44m [0m',
	\ '                                         [94;44m   [93;103m  [0m',
	\ '                                         [90;100m      [0m',
	\ '                                          [90;100m      [0m',
	\ ]

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0

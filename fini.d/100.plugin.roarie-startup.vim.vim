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

if has("nvim")

let g:roarie_startup_screen_lines = [
	\ '             [40m[37m              [40m[34m▃▃▃▃[0m',
	\ '             [40m[37m           [40m[34m▟[44m[94m        [40m[34m▙[0m',
	\ '             [40m[35m▟▙▃▟▙      [44m[34m [44m[33m/\[34m[34m    [34m[33m/\[34m[34m [40m[37m   [40m[97mroar![0m',
	\ '             [40m[35m▜[40m[95m▒▓▒[40m[35m▛      [104m[94m  [103m[94m▛ [103m[33m""" [103m[94m▜[104m[34m [40m[37m  [40m[97m/[0m',
	\ '             [40m[37m [40m[35m▜[45m[35m [40m[35m▛       [104m[94m [103m[30m  ^ _ ^ [104m[94m [40m[37m [40m[97m/[0m',
	\ '             [40m[37m  [40m[35m▀        [46m[36m [103m[33m (__[103m[30my[103m[33m_)[103m[30m [46m[36m [0m',
	\ '             [40m[37m [40m[93m▟▙    ▁▂▃▟[103m[36m▐[40m[36m▙[40m[93m▜[103m[33m`\_/[40m[93m▛[40m[36m▟▌[0m',
	\ '             [40m[37m [40m[93m▟▙   ▟[103m[30m    [103m[36m▓▓▓[103m[30m| |[40m[93m▍[40m[36m▓▓▓[0m',
	\ '  [90m/\/\     _[0m [40m[37m [40m[93m▜[103m[30m\[40m[93m▙ ▟[103m[30m    [103m[36m▓▓▓▓▓[103m[30m |[40m[36m▓▓▓▓▓[0m',
	\ ' [90m/[0mo[90m.[0mo[90m \ -.(([0m [40m[37m  [40m[93m▜[103m[30m\\roa \ [103m[36m▒▒▒[103m[30m|[103m[33m [103m[30m|[40m[37m [40m[36m▒▒▒[0m',
	\ ' [90m\_^__/\  \))[0m[40m[37m   [40m[93m▜[103m[30m\ rie ) [103m[36m▒[103m[30m_|[103m[33m [103m[30m|[40m[93m▙ [40m[36m▒[0m',
	\ ' [90m(_(_,__(_|/[0m [40m[37m   [103m[30m([4m     /  ))))))[0m',
	\ '[󰍜  Mappings menu            <ALT-M>]',
	\ ']󰘳  Command palette         <CTRL-P>[',
	\ '[  Complete in insert mode  <S-TAB>]',
	\ ']  Peek definition             <F1>[',
	\ '[  Go to definition            <F2>]',
	\ ']󱔁  Document symbols picker...  <F3>[',
	\ '[ﯼ  Toggle symbols sidebar    <C-F3>]     [36;46m [0m',
	\ ']󰋖  Display manual page...    <C-F4>[    [36;46m   [0m',
	\ '[  Build...                    <F5>]   [36;46m     [0m',
	\ ']  GDB submenu...          <M-S-F5>[  [36;46m [93;103m [30m/[93;103m  [0m',
	\ '[  Git status                  <F6>] [36;46m [93;103m [30m_[30;40m_[30;103m_[30;40m_[30;103m_[0m',
	\ ']  Create new window           <F7>[[36;46m   [93;103m    [0m',
	\ '[󰓩  Open a new tab page         <F8>][36;46m    [93;103m  [0m [93;103m [0m',
	\ ']  Close current window/tab  <S-F8>[[36;46m   [94;44m    [93;103m [0m',
	\ '[  Live grep picker..   .     <F10>] [36;46m [30;40m [94;44m [97mKA[94m [0m',
	\ ']  Open terminal              <F11>[   [94;44m [97mDE[94m [0m',
	\ '[  Toggle file tree sidebar   <F12>]   [94;44m   [93;103m  [0m',
	\ ']  Files picker...          <C-F12>[   [90;100m     [30;40m [0m',
	\ '[ﰇ  Restart last picker...   <M-F12>]    [90;100m     [30;40m [0m',
	\ ]
else

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
	\ ']  Grep...                    <F10>[',
	\ '[  Open terminal              <F11>]',
	\ ']  Toggle file tree sidebar   <F12>[',
	\ ]

endif

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0

"
" [Options] Defaults
"

let g:VM_leader="'"		" Set Visual-Multi (VM) leader
let mapleader="'"		" Set mapping leader string

set complete-=i			" Exclude included files when completing keyword
set encoding=utf-8		" Global UTF-8 character encoding
set mouse=a			" Enable the use of the mouse for all modes
set noautoread			" Don't automatically re-read a file that has been changed outside of Vim
set nobackup nowritebackup	" Don't write backups for existing files
set nohidden			" Abandon buffer when unloaded
set noundofile			" Do not automatically saves undo history
set t_Co=256			" Force 256 colour terminal
set termwinkey=<C-T>		" Set key starts a command in a terminal window to CTRL-T
set timeout timeoutlen=100	" Decrease escape sequences latency
set viminfo=""			" Neither read nor write /viminfo/ file

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0

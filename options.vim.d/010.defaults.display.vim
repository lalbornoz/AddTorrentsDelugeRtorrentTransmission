"
" [Options] Defaults (display)
"

set background=dark		" Use colours that look good on a dark background
set commentstring=/*\ %s\ */	" Use when adding markers for folding by default
set cursorcolumn cursorline	" Highlight the screen {column,line} of the cursor
set foldmethod=marker		" Fold via explicit markers
set ignorecase			" Ignore case when searching
set incsearch nohlsearch	" Incremental search, no match highlighting
set laststatus=2		" Last window always has status line
set modeline			" Parse {vi{,m}, ex} (1) modelines
set noshowmode			" Don't show mode in last line
set number			" Show line numbers
set ruler			" Show line, column, virtual column, percentage through file in ruler
set rulerformat=%15(%l,%c%V\ %P%)
set shortmess+=S		" Always show "search hit BOTTOM, continuing at TOP" message
set showcmd			" Show (partial) command in the last line
set scrolloff=10		" Keep at least 10 screen lines above/below cursor
set sidescroll=10		" Scroll 10 columns horizontally at minimum
set sidescrolloff=10		" Keep at least 10 screen columns to the left/right of cursor
set virtualedit=block		" Allow virtual editing in Visual block mode

"
" Enable 24-bit colours in non-GUI {screen,tmux} sessions
"
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
set termguicolors

colors gruvbox			" Select colourscheme
filetype plugin indent on	" Enable file type detection & autoloading plugin files and indent file
syntax on			" Turn on syntax highlighting

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0

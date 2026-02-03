"
" [Options] Defaults (display)
"

set cursorcolumn cursorline	" Highlight the screen {column,line} of the cursor
set ignorecase			" Ignore case when searching
set incsearch nohlsearch	" Incremental search, no match highlighting
set laststatus=2		" Last window always has status line
set modeline			" Parse {vi{,m}, ex} (1) modelines
set noshowmode			" Don't show mode in last line
set number			" Show line numbers
set shortmess+=S		" Always show "search hit BOTTOM, continuing at TOP" message
set showcmd			" Show (partial) command in the last line
set scrolloff=10		" Keep at least 10 screen lines above/below cursor
set sidescroll=10		" Scroll 10 columns horizontally at minimum
set sidescrolloff=10		" Keep at least 10 screen columns to the left/right of cursor
set virtualedit=block		" Allow virtual editing in Visual block mode

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0

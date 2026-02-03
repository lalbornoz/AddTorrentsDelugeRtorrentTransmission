"
" [Mappings] Legacy non-GUI Vim key aliases (assuming XTerm-compatible terminal)
"

if !has('gui_running')

" {{{ <https://github.com/vim/vim/issues/9009>
" Enable modified arrow keys, see  :help xterm-modifier-keys
execute "silent! set <xUp>=\<Esc>[@;*A"
execute "silent! set <xDown>=\<Esc>[@;*B"
execute "silent! set <xRight>=\<Esc>[@;*C"
execute "silent! set <xLeft>=\<Esc>[@;*D"
" }}}

" {{{ <Shift> cursor keys w/ modifiers
map <Esc>[1;2A		<S-Up>
map <Esc>[1;2B		<S-Down>
map <Esc>[1;2C		<S-Right>
map <Esc>[1;2D		<S-Left>
" }}}
" {{{ <Alt>, <Alt><Shift> cursor keys w/ modifiers
map <Esc>[1;3A		<M-Up>
map <Esc>[1;3B		<M-Down>
map <Esc>[1;3C		<M-Right>
map <Esc>[1;3D		<M-Left>
map <Esc>[1;4A		<M-S-Up>
map <Esc>[1;4B		<M-S-Down>
map <Esc>[1;4C		<M-S-Right>
map <Esc>[1;4D		<M-S-Left>
" }}}
" {{{ <Ctrl>, <Ctrl><Shift> cursor keys w/ modifiers
map <Esc>[1;5A		<C-Up>
map <Esc>[1;5B		<C-Down>
map <Esc>[1;5C		<C-Right>
map <Esc>[1;5D		<C-Left>
map <Esc>[1;6A		<C-S-Up>
map <Esc>[1;6B		<C-S-Down>
map <Esc>[1;6C		<C-S-Right>
map <Esc>[1;6D		<C-S-Left>
" }}}
" {{{ <Ctrl><Alt>, <Ctrl><Alt><Shift> cursor keys w/ modifiers
map <Esc>[1;7A		<M-C-Up>
map <Esc>[1;7B		<M-C-Down>
map <Esc>[1;7C		<M-C-Right>
map <Esc>[1;7D		<M-C-Left>

map <Esc>[1;8A		<M-C-S-Up>
map <Esc>[1;8B		<M-C-S-Down>
map <Esc>[1;8C		<M-C-S-Right>
map <Esc>[1;8D		<M-C-S-Left>
" }}}

" {{{ <Ctrl>, <Ctrl><Shift>, <Alt>, <Alt><Shift> navigation keys w/ modifiers
map <Esc>[2;5~		<C-Insert>
map <Esc>[2;6~		<C-S-Insert>
map <Esc>[2;3~		<M-Insert>
map <Esc>[2;4~		<M-S-Insert>

map <Esc>[3;5~		<C-Delete>
map <Esc>[3;6~		<C-S-Delete>
map <Esc>[3;3~		<M-Delete>
map <Esc>[3;4~		<M-S-Delete>

map <Esc>[1;5H		<C-Home>
map <Esc>[1;6H		<C-S-Home>
map <Esc>[1;3H		<M-Home>
map <Esc>[1;4H		<M-S-Home>

map <Esc>[1;5F		<C-End>
map <Esc>[1;6F		<C-S-End>
map <Esc>[1;3F		<M-End>
map <Esc>[1;4F		<M-S-End>

map <Esc>[5;5~		<C-PageUp>
map <Esc>[5;6~		<C-S-PageUp>
map <Esc>[5;3~		<M-PageUp>
map <Esc>[5;4~		<M-S-PageUp>

map <Esc>[6;5~		<C-PageDown>
map <Esc>[6;6~		<C-S-PageDown>
map <Esc>[6;3~		<M-PageDown>
map <Esc>[6;4~		<M-S-PageDown>
" }}}

" {{{ Function key pseudo-mappings
map <Esc>[OP		<F1>
map <Esc>[OQ		<F2>
map <Esc>[OR		<F3>
map <Esc>[OS		<F4>
map <Esc>[15~		<F5>
map <Esc>[17~		<F6>
map <Esc>[18~		<F7>
map <Esc>[19~		<F8>
map <Esc>[20~		<F9>
map <Esc>[21~		<F10>
map <Esc>[23~		<F11>
map <Esc>[24~		<F12>
" }}}
" {{{ <Shift> function key pseudo-mappings
map <Esc>[1;2P		<S-F1>
map <Esc>[1;2Q		<S-F2>
map <Esc>[1;2R		<S-F3>
map <Esc>[1;2S		<S-F4>
map <Esc>[15;2~		<S-F5>
map <Esc>[17;2~		<S-F6>
map <Esc>[18;2~		<S-F7>
map <Esc>[19;2~		<S-F8>
map <Esc>[20;2~		<S-F9>
map <Esc>[21;2~		<S-F10>
map <Esc>[23;2~		<S-F11>
map <Esc>[24;2~		<S-F12>
" }}}
" {{{ <Alt> function key pseudo-mappings
map <Esc>[1;3P		<M-F1>
map <Esc>[1;3Q		<M-F2>
map <Esc>[1;3R		<M-F3>
map <Esc>[1;3S		<M-F4>
map <Esc>[15;3~		<M-F5>
map <Esc>[17;3~		<M-F6>
map <Esc>[18;3~		<M-F7>
map <Esc>[19;3~		<M-F8>
map <Esc>[20;3~		<M-F9>
map <Esc>[21;3~		<M-F10>
map <Esc>[23;3~		<M-F11>
map <Esc>[24;3~		<M-F12>
" }}}
" {{{ <Alt><Shift> function key pseudo-mappings
map <Esc>[1;4P		<M-S-F1>
map <Esc>[1;4Q		<M-S-F2>
map <Esc>[1;4R		<M-S-F3>
map <Esc>[1;4S		<M-S-F4>
map <Esc>[15;4~		<M-S-F5>
map <Esc>[17;4~		<M-S-F6>
map <Esc>[18;4~		<M-S-F7>
map <Esc>[19;4~		<M-S-F8>
map <Esc>[20;4~		<M-S-F9>
map <Esc>[21;4~		<M-S-F10>
map <Esc>[23;4~		<M-S-F11>
map <Esc>[24;4~		<M-S-F12>
" }}}
" {{{ <Ctrl> function key pseudo-mappings
map <Esc>[1;5P		<C-F1>
map <Esc>[1;5Q		<C-F2>
map <Esc>[1;5R		<C-F3>
map <Esc>[1;5S		<C-F4>
map <Esc>[15;5~		<C-F5>
map <Esc>[17;5~		<C-F6>
map <Esc>[18;5~		<C-F7>
map <Esc>[19;5~		<C-F8>
map <Esc>[20;5~		<C-F9>
map <Esc>[21;5~		<C-F10>
map <Esc>[23;5~		<C-F11>
map <Esc>[24;5~		<C-F12>
" }}}
" {{{ <Ctrl><Shift> function key pseudo-mappings
map <Esc>[1;6P		<C-S-F1>
map <Esc>[1;6Q		<C-S-F2>
map <Esc>[1;6R		<C-S-F3>
map <Esc>[1;6S		<C-S-F4>
map <Esc>[15;6~		<C-S-F5>
map <Esc>[17;6~		<C-S-F6>
map <Esc>[18;6~		<C-S-F7>
map <Esc>[19;6~		<C-S-F8>
map <Esc>[20;6~		<C-S-F9>
map <Esc>[21;6~		<C-S-F10>
map <Esc>[23;6~		<C-S-F11>
map <Esc>[24;6~		<C-S-F12>
" }}}

map <Esc>[1;5Z		<C-S-Tab>

endif

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0

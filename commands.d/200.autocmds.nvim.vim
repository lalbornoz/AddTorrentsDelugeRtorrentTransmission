"
" [AutoCmds] Neovim
"

if has('nvim')

" <https://vi.stackexchange.com/questions/3670/how-to-enter-insert-mode-when-entering-neovim-terminal-pane>
autocmd BufWinEnter,WinEnter term://* startinsert

endif

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0

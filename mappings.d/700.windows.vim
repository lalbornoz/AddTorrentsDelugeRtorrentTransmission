"
" [Mappings] Windows menu mappings
"

call roarie_commands#AddMenu("&Windows")
call roarie_commands#AddMapping("&Windows", "create_window", "&Create new window", "Create new window", '<silent>', '<F7>', ':<C-U>new<CR>', "<fnalias>", "")
call roarie_commands#AddMapping("&Windows", "split_window", "&Split window", "Split current window in two", "<silent>", '<C-t>', ':<C-U>wincmd s<CR>', "", "")
call roarie_commands#AddMapping("&Windows", "create_window_vertical", "&Create new vertically split window", "Create new vertically split window", '<silent>', '<S-F7>', ':<C-U>vnew<CR>', "<fnalias>", "")
call roarie_commands#AddMapping("&Windows", "rotate_windows_downright", "Rotate &windows down/right", "Rotate windows downwards/rightwards", '<silent>', '<C-F7>', ':<C-U>wincmd r<CR>', "<fnalias>", "")
call roarie_commands#AddMapping("&Windows", "rotate_windows_upleft", "Rotate &windows up/left", "Rotate windows upwards/leftwards", '<silent>', '<C-S-F7>', ':<C-U>wincmd R<CR>', "<fnalias>", "")
call roarie_commands#AddMapping("&Windows", "close_current_window", "&Close current window", "Close current window", '<silent>', '<S-F8>', ':<C-U>close<CR>', "<fnalias>", "")
call roarie_commands#AddSeparator("&Windows")
call roarie_commands#AddMapping("&Windows", "decr_win_height", "&Decrease window height", "Decrease current window height by 3", "<silent>", '<M-S-Up>', ':<C-U>resize -3<CR>', "", "")
call roarie_commands#AddMapping("&Windows", "incr_win_height", "&Increase window height", "Increase current window height by 3", "<silent>", '<M-S-Down>', ':<C-U>resize +3<CR>', "", "")
call roarie_commands#AddMapping("&Windows", "decr_win_width", "&Decrease window width", "Decrease current window width by 3", "<silent>", '<M->>', ':<C-U>vertical resize -3<CR>', "", "")
call roarie_commands#AddMapping("&Windows", "incr_win_width", "&Increase window width", "Increase current window width by 3", "<silent>", '<M-<>', ':<C-U>vertical resize +3<CR>', "", "")
call roarie_commands#AddSeparator("&Windows")
call roarie_commands#AddMapping("&Windows", "move_window_above", "Move to tmux or Vim window &above", "Move to 1st tmux pane or Vim window above current", "<silent>", '<M-Up>', ':<C-U>TmuxNavigateUp<CR>', "", "ﲓ")
call roarie_commands#AddMapping("&Windows", "move_window_above", "Move to tmux or Vim window &above", "Move to 1st tmux pane or Vim window above current", "<silent>", '<C-k>', ':<C-U>TmuxNavigateUp<CR>', "", "ﲓ")
call roarie_commands#AddMapping("&Windows", "move_window_below", "Move to tmux or Vim window &below", "Move to 1st tmux pane or Vim window below current", "<silent>", '<M-Down>', ':<C-U>TmuxNavigateDown<CR>', "", "ﲐ")
call roarie_commands#AddMapping("&Windows", "move_window_below", "Move to tmux or Vim window &below", "Move to 1st tmux pane or Vim window below current", "<silent>", '<C-j>', ':<C-U>TmuxNavigateDown<CR>', "", "ﲐ")
call roarie_commands#AddMapping("&Windows", "move_window_left", "Move to window to &left", "Move to 1st window left of current", "<silent>", '<M-Left>', ':<C-U>wincmd h<CR>', "", "ﲑ")
call roarie_commands#AddMapping("&Windows", "move_window_right", "Move to window to &right", "Move to 1st window right of current", "<silent>", '<M-Right>', ':<C-U>wincmd l<CR>', "", "ﲒ")

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0

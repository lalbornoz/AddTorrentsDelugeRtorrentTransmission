"
" [Mappings] File menu mappings
"

call roarie_commands#AddMenu("&File")
call roarie_commands#AddMapping("&File", "open_menu", "Open &menu...", "Open menu...", '<silent>', '<M-m>', ':<C-U>call roarie_commands#OpenMenu()<CR>', "", "󰍜")
call roarie_commands#AddMapping("&File", "command_palette", "Command &palette...", "Command palette", '<silent>', '<C-p>', ':<C-U>Telescope roarie_palette<CR>', "", "󰘳")
call roarie_commands#AddSeparator("&File")
call roarie_commands#AddMapping("&File", "terminal_open", "Open &terminal...", "Open a new terminal window", "<silent>", '<F11>', ':<C-U>terminal<CR>', "<fnalias>")
call roarie_commands#AddMapping("&File", "terminal_open_tab", "Open &terminal tab...", "Open a new terminal tab", '', '<S-F11>', ':<C-U>tab terminal<CR>', "<fnalias>")
call roarie_commands#AddSeparator("&File")
call roarie_commands#AddMapping("&File", "toggle_nerdtree", "Toggle fil&e tree sidebar", "Toggle NERDTree sidebar", "<silent>", '<F12>', ':<C-U>NERDTreeToggle<CR>', "<fnalias>")
call roarie_commands#AddSeparator("&File")
call roarie_commands#AddIMapping("&File", "exit_insert", "E&xit insert mode", "Exit insert mode", '', '<C-Q>', '<Esc>', "", "")
call roarie_commands#AddTMapping("&File", "switch_normal_mode_terminal", "Switch to &normal mode (terminal)", "Switch to normal mode (terminal job mode)", "<silent>", '<C-b>', '<C-T>N')

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0

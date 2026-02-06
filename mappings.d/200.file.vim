"
" [Mappings] File menu mappings
"

call roarie_commands#AddMenu("&File")
call roarie_commands#AddMapping("&File", "open_menu", "Open &menu...", "Open menu...", '<silent>', '<M-m>', ':<C-U>call roarie_commands#OpenMenu()<CR>', "", "󰍜")
call roarie_commands#AddSeparator("&File")
call roarie_commands#AddMapping("&File", "search_files_rg", "&Search in files...", "Search in files with fzf and ripgrep...", '', '<F10>', ':<C-U>FzfRg<CR>', "<fnalias>")
call roarie_commands#AddMapping("&File", "search_buffer_cur", "Search in &current buffer...", "Search in current buffer with fzf...", '', '<C-F10>', ':<C-U>FzfBLines<CR>', "<fnalias>")
call roarie_commands#AddMapping("&File", "search_buffer_all", "Search in &all buffers...", "Search in all loaded buffers with fzf...", '', '<S-F10>', ':<C-U>FzfLines<CR>', "<fnalias>")
call roarie_commands#AddSeparator("&File")
call roarie_commands#AddMapping("&File", "fzf_changes", "Show change&list...", "Show changelist across all open buffers with fzf...", '', '<F11>', ':<C-U>FzfChanges<CR>', "<fnalias>")
call roarie_commands#AddMapping("&File", "fzf_marks", "Show ma&rks...", "Show marks in the current buffer with fzf...", '', '<S-F11>', ':<C-U>FzfBMarks<CR>', "<fnalias>")
call roarie_commands#AddMapping("&File", "fzf_jumps", "Show &jumps...", "Show jumps in the current buffer with fzf...", '', '<C-F11>', ':<C-U>FzfJumps<CR>', "<fnalias>")
call roarie_commands#AddMapping("&File", "fzf_windows", "Show &windows...", "Show windows with fzf...", '', '<M-F11>', ':<C-U>FzfWindows<CR>', "<fnalias>")
call roarie_commands#AddSeparator("&File")
call roarie_commands#AddMapping("&File", "terminal_open", "Open &terminal...", "Open a new terminal window", "<silent>", '<F12>', ':<C-U>terminal<CR>', "<fnalias>")
call roarie_commands#AddMapping("&File", "terminal_open_tab", "Open &terminal tab...", "Open a new terminal tab", '', '<S-F12>', ':<C-U>tab terminal<CR>', "<fnalias>")
call roarie_commands#AddMapping("&File", "toggle_nerdtree", "Toggle fil&e tree sidebar", "Toggle NERDTree sidebar", "<silent>", '<M-F12>', ':<C-U>NERDTreeToggle<CR>', "<fnalias>")
call roarie_commands#AddSeparator("&File")
call roarie_commands#AddIMapping("&File", "exit_insert", "E&xit insert mode", "Exit insert mode", '', '<C-Q>', '<Esc>', "", "")
call roarie_commands#AddTMapping("&File", "switch_normal_mode_terminal", "Switch to &normal mode (terminal)", "Switch to normal mode (terminal job mode)", "<silent>", '<C-b>', '<C-T>N')

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0

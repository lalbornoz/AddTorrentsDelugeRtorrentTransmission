"
" [Mappings] Tabs menu mappings
"

call roarie_commands#AddMenu("&Tabs")
call roarie_commands#AddMapping("&Tabs", "tab_goto1", "&Go to tab #1", '', '<silent>', '<M-1>', '1gt', "", "")
call roarie_commands#AddMapping("&Tabs", "tab_goto2", "&Go to tab #2", '', '<silent>', '<M-2>', '2gt', "", "")
call roarie_commands#AddMapping("&Tabs", "tab_goto3", "&Go to tab #3", '', '<silent>', '<M-3>', '3gt', "", "")
call roarie_commands#AddMapping("&Tabs", "tab_goto4", "&Go to tab #4", '', '<silent>', '<M-4>', '4gt', "", "")
call roarie_commands#AddMapping("&Tabs", "tab_goto5", "&Go to tab #5", '', '<silent>', '<M-5>', '5gt', "", "")
call roarie_commands#AddMapping("&Tabs", "tab_goto6", "&Go to tab #6", '', '<silent>', '<M-6>', '6gt', "", "")
call roarie_commands#AddMapping("&Tabs", "tab_goto7", "&Go to tab #7", '', '<silent>', '<M-7>', '7gt', "", "")
call roarie_commands#AddMapping("&Tabs", "tab_goto8", "&Go to tab #8", '', '<silent>', '<M-8>', '8gt', "", "")
call roarie_commands#AddMapping("&Tabs", "tab_goto9", "&Go to tab #9", '', '<silent>', '<M-9>', '9gt', "", "")
call roarie_commands#AddSeparator("&Tabs")
call roarie_commands#AddMapping("&Tabs", "tab_goto_prev", "Go to &previous tab", "Go to previous tab page w/ wraparound", "<silent>", '<M-S-Left>', ':<C-U>tabprev<CR>', "", "﮿")
call roarie_commands#AddMapping("&Tabs", "tab_goto_next", "Go to &next tab", "Go to next tab page w/ wraparound", "<silent>", '<M-S-Right>', ':<C-U>tabnext<CR>', "", "﯀")
call roarie_commands#AddTMapping("&Tabs", "tab_goto_prev_terminal", "Go to &previous tab (terminal)", "Go to previous tab page w/ wraparound (terminal job mode)", "<silent>", '<C-f>', '<C-T>:tabprev<CR>')
call roarie_commands#AddTMapping("&Tabs", "tab_goto_prev_terminal", "Go to &previous tab (terminal)", "Go to previous tab page w/ wraparound (terminal job mode)", "<silent>", '<M-S-Left>', '<C-T>:tabprev<CR>')
call roarie_commands#AddTMapping("&Tabs", "tab_goto_next_terminal", "Go to &next tab (terminal)", "Go to next tab page w/ wraparound (terminal job mode)", "<silent>", '<C-h>', '<C-T>:tabnext<CR>')
call roarie_commands#AddTMapping("&Tabs", "tab_goto_next_terminal", "Go to &next tab (terminal)", "Go to next tab page w/ wraparound (terminal job mode)", "<silent>", '<M-S-Right>', '<C-T>:tabnext<CR>')
call roarie_commands#AddSeparator("&Tabs")
call roarie_commands#AddMapping("&Tabs", "open_new_tab", "&Open a new tab page", "Open a new tab page", "<silent>", '<F8>', ':<C-U>tabnew<CR>', "<fnalias>", "ﱚ")
call roarie_commands#AddMapping("&Tabs", "close_current_tab", "&Close current tab", "Close current tab", "<silent>", '<S-F8>', ':<C-U>close<CR>', "<fnalias>", "")
call roarie_commands#AddMapping("&Tabs", "move_window_to_tab", "Move &window to new tab", "Move window to new tab page", "<silent>", '<M-t>', ':<C-U>wincmd T<CR>', "", "")
call roarie_commands#AddMapping("&Tabs", "tab_move_left", "Move current tab to the &left", "Move current tab to the left", "<silent>", '<M-j>', ':<C-U>:if tabpagenr() > 1 \| tabmove -1 \| endif<CR>', "", "ﰰ")
call roarie_commands#AddMapping("&Tabs", "tab_move_right", "Move current tab to the &right", "Move current tab to the right", "<silent>", '<M-k>', ':<C-U>:if tabpagenr() < tabpagenr(''$'') \| tabmove +1 \| endif<CR>', "", "ﰳ")

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0

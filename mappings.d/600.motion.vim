"
" [Mappings] Motion menu mappings
"

call roarie_commands#AddMenu("&Motion")
call roarie_commands#AddMapping("&Motion", "motion_word_prev", "Go to previous &word", "Go to previous word", '', '<C-Left>', 'b', "", "")
call roarie_commands#AddMapping("&Motion", "motion_WORD_prev", "Go to previous &WORD", "Go to previous WORD", '', '<C-S-Left>', 'B', "", "")
call roarie_commands#AddMapping("&Motion", "motion_word_next", "Go to next &word", "Go to next word", '', '<C-Right>', 'w', "", "")
call roarie_commands#AddMapping("&Motion", "motion_WORD_next", "Go to next &WORD", "Go to next WORD", '', '<C-S-Right>', 'W', "", "")
call roarie_commands#AddSeparator("&Motion")
call roarie_commands#AddMapping("&Motion", "motion_word_end_prev", "Go to &end of previous word", "Go to end of previous word", '', '<M-C-Left>', 'ge', "", "﮿")
call roarie_commands#AddMapping("&Motion", "motion_WORD_end_prev", "Go to &end of previous WORD", "Go to end of previous WORD", '', '<M-C-S-Left>', 'gE', "", "ﰰ")
call roarie_commands#AddMapping("&Motion", "motion_word_end", "Go to &end of word", "Go to end of word", '', '<M-C-Right>', 'e', "", "﯀")
call roarie_commands#AddMapping("&Motion", "motion_WORD_end", "Go to &end of WORD", "Go to end of WORD", '', '<M-C-S-Right>', 'E', "", "ﰳ")
call roarie_commands#AddSeparator("&Motion")
call roarie_commands#AddMapping("&Motion", "motion_para_prev", "Go to previous &paragraph", "Go to previous paragraph", '', '<C-Up>', '{', "", "")
call roarie_commands#AddMapping("&Motion", "motion_section_prev", "Go to previous &section", "Go to previous section", '', '<C-S-Up>', '[[', "", "")
call roarie_commands#AddMapping("&Motion", "motion_para_next", "Go to next &paragraph", "Go to next paragraph", '', '<C-Down>', '}', "", "")
call roarie_commands#AddMapping("&Motion", "motion_section_next", "Go to next &section", "Go to next section", '', '<C-S-Down>', ']]', "", "")
call roarie_commands#AddSeparator("&Motion")
call roarie_commands#AddMapping("&Motion", "motion_line_first", "Go to &first line", "Go to first line", '', '<M-C-Up>', 'gg', "", "ﯺ")
call roarie_commands#AddMapping("&Motion", "motion_line_last", "Go to &last line", "Go to last line", '', '<M-C-Down>', 'G', "", "ﯹ")
call roarie_commands#AddSeparator("&Motion")
call roarie_commands#AddMapping("&Motion", "motion_cursor_prev", "Go to previous &cursor position", "Go to previous cursor position in jump list", '', '<S-Left>', '<C-O>', "", "ﲗ")
call roarie_commands#AddMapping("&Motion", "motion_cursor_next", "Go to next &cursor position", "Go to next cursor position in jump list", '', '<S-Right>', '<C-I>', "", "ﲔ")
call roarie_commands#AddMapping("&Motion", "motion_occur_prev", "Go to previous &occurrence", "Go to previous occurrence of the word nearest to the cursor", '', '<S-Up>', '#', "", "")
call roarie_commands#AddMapping("&Motion", "motion_occur_next", "Go to next &occurrence", "Go to next occurrence of the word nearest to the cursor", '', '<S-Down>', '*', "", "")
call roarie_commands#AddMapping("&Motion", "motion_item_prev", "Go to previous &item", "Go to previous item in this line after or under the cursor and jump to its match", "<silent>", '<M-PageUp>', ':<C-U>call matchit#Match_wrapper('''',0,''n'')<CR>', "", "󱉜")
call roarie_commands#AddMapping("&Motion", "motion_item_next", "Go to next &item", "Go to next item in this line after or under the cursor and jump to its match", "<silent>", '<M-PageDown>', ':<C-U>call matchit#Match_wrapper('''',1,''n'')<CR>', "", "󱉚")

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0

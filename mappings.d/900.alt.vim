"
" [Mappings] <Alt> menu mappings
"

call roarie_commands#AddMenu("<&Alt>")
call roarie_commands#AddMapping("<&Alt>", "mark_set_x", "Set &mark x", "Set mark x at cursor position", "<silent>", '<M-:>', 'mx', "", "ﭑ")
call roarie_commands#AddMapping("<&Alt>", "exec_register_q", "Execute register &q", "Execute contents of register q", "<silent>", '<M-@>', ':normal! @q<CR>', "", "")
call roarie_commands#AddMapping("<&Alt>", "mark_jump_x", "Jump to &mark x", "Jump to mark x in the current buffer", "<silent>", '<M-~>', "'x", "", "ﲖ")
call roarie_commands#AddSeparator("<&Alt>")
call roarie_commands#AddMapping("<&Alt>", "insert_date", "Insert &date (LC_ALL=C)", "Insert date (LC_ALL=C)", '<silent>', '<M-d>', ':<C-U>:r!env LC_ALL=C date<CR>', "", "")
call roarie_commands#AddMapping("<&Alt>", "insert_date_rfc2822", "Insert &date (RFC 2822/2322)", "Insert date in RFC 2822/5322 format", "<silent>", '<M-D>', ':<C-U>:r!env LC_ALL=C date +"\%a, \%d \%b \%Y \%T \%z"<CR>', "", "")
call roarie_commands#AddMapping("<&Alt>", "convert_to_prototype", "Convert to &prototype", "Convert to prototype", '<silent>', '<M-p>', 'J<Esc>:s/\t/ /eg<CR>:s/ \+/ /eg<CR>:s/( /(/<CR>:s/ \* / */eg<CR>:s/$/;/<CR>', "", "")
call roarie_commands#AddMapping("<&Alt>", "edit_vimrc", "Edit &Vim configuration...", "Edit Vim configuration file in new window", "<silent>", '<M-v>', ':<C-U>tabnew\|e ~/.vimrc<CR>', "", "")
call roarie_commands#AddSeparator("<&Alt>")
call roarie_commands#AddMapping("<&Alt>", "toggle_foldmethod", "Toggle f&oldmethod", "Toggle between foldmethod=marker and foldmethod=indent", '<silent>', '<M-f>', ':<C-U>ToggleFoldMethod<CR>', "", "")
call roarie_commands#AddMapping("<&Alt>", "toggle_hlsearch", "Toggle &search match highlighting", "Toggle search match highlighting", '<silent>', '<M-h>', ':<C-U>set invhlsearch<CR>', "", "")
call roarie_commands#AddMapping("<&Alt>", "toggle_number", "Toggle &line numbers", "Toggle wrapping of lines longer than window width", "<silent>", '<M-l>', ':<C-U>set invnumber<CR>', "", "")
call roarie_commands#AddMapping("<&Alt>", "toggle_list", "Toggle l&ist mode", "Toggle displaying of tabs and ends of lines", "<silent>", '<M-L>', ':<C-U>set invlist<CR>', "", "")
call roarie_commands#AddMapping("<&Alt>", "toggle_case", "Toggle &case-sensitivity", "Toggle case-sensitivity", '<silent>', '<M-n>', ':<C-U>set invignorecase<CR>:<C-U>call lightline#update()<CR>', "", "")
call roarie_commands#AddMapping("<&Alt>", "set_filetype_terminal", "Set filetype=&terminal", "Set filetype=terminal", '<silent>', '<M-r>', ':<C-U>set filetype=terminal<CR>', "", "")
call roarie_commands#AddMapping("<&Alt>", "toggle_wrap", "Toggle &line-wrap", "Toggle wrapping of lines longer than window width", "<silent>", '<M-w>', ':<C-U>set invwrap<CR>', "", "")
call roarie_commands#AddMapping("<&Alt>", "set_tw0", "Set t&w=0", "Set textwidth to 0", "<silent>", '<M-W>', ':<C-U>set tw=0<CR>', "", "")
call roarie_commands#AddMapping("<&Alt>", "reset_folds", "&Reset folding", "Reset folding", '<silent>', '<M-x>', ':<C-U>set foldmethod=marker<CR>', "", "ﱱ")
call roarie_commands#AddMapping("<&Alt>", "reset_syntax", "Reset s&yntax highlighting", "Reset syntax highlighting", '<silent>', '<M-y>', ':<C-U>syntax on<CR>', "", "")
call roarie_commands#AddMapping("<&Alt>", "helptags", "Regenerate help t&ags", "Regenerate all help tags", '<silent>', '<M-z>', ':<C-U>Helptags<CR>')

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0

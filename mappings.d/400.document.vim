"
" [Mappings] Document menu mappings
"

call roarie_commands#AddMenu("&Document")
call roarie_commands#AddMapping("&Document", "peek_define", "Peek &definition", "Peek definition", "<silent>", '<F1>', ':<C-U>LspPeekDefinition<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Document", "find_all_refs", "Find all &references", "Find all LSP references", "<silent>", '<C-F1>', ':<C-U>LspReferences<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Document", "peek_decl", "Peek de&claration", "Peek declaration", "<silent>", '<S-F1>', ':<C-U>LspPeekDeclaration<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Document", "goto_define", "Go to &definition", "Go to definition", "<silent>", '<F2>', ':<C-U>LspDefinition<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Document", "goto_decl", "Go to de&claration", "Go to declaration", "<silent>", '<S-F2>', ':<C-U>LspDeclaration<CR>', "<fnalias>")
call roarie_commands#AddSeparator("&Document")
call roarie_commands#AddMapping("&Document", "search_document_symbols", "Search document &symbols...", "Search the symbols for the current document and navigate", "<silent>", '<F3>', ':<C-U>LspDocumentSymbolSearch<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Document", "search_workspace_symbols", "Search &workspace symbols...", "Search the workspace symbols for all servers and navigate using quickpick", "<silent>", '<S-F3>', ':<C-U>LspWorkspaceSymbolSearch<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Document", "goto_diag_next", "Go to &next diagnostic", "Go to next diagnostic in file", "<silent>", '<C-PageDown>', ':<C-U>LspNextDiagnostic<CR>')
call roarie_commands#AddMapping("&Document", "goto_diag_prev", "Go to &previous diagnostic", "Go to previous diagnostic in file", "<silent>", '<C-PageUp>', ':<C-U>LspPreviousDiagnostic<CR>')
call roarie_commands#AddSeparator("&Document")
call roarie_commands#AddMapping("&Document", "display_hover", "Display &hover information", "Get hover information & display in preview-window", "<silent>", '<F4>', ':<C-U>LspHover<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Document", "code_action", "Code act&ion...", "Code action...", "<silent>", '<S-F4>', ':<C-U>LspCodeAction<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Document", "display_man_prompt", "Display &manual page...", "Display manual page prompt", "", '<C-F4>', ':<C-U>Man ', "<fnalias>", "󰋖")
call roarie_commands#AddMapping("&Document", "display_man", "Display &manual page", "Display manual page from current word", "<silent>", '<C-S-F4>', '"zyiw:exe "Man ".@z.""<CR>', "<fnalias>", "ﲉ")
call roarie_commands#AddSeparator("&Document")
call roarie_commands#AddMapping("&Document", "quickfix_window", "&QuickFix window...", "Toggle the QuickFix window given recognised errors", "<silent>", '<M-F8>', ':<C-U>ToggleQuickFix<CR>', "<fnalias>")

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0

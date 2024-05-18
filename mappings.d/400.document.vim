"
" [Mappings] Document menu mappings
"

call roarie_commands#AddMenu("&Document")
if has('nvim')
call roarie_commands#AddMapping("&Document", "peek_define", "Peek &definition", "Peek definition", "<silent>", '<F1>', '<Cmd>lua require("goto-preview").goto_preview_definition()<CR>', "<fnalias>", "")
call roarie_commands#AddMapping("&Document", "peek_decl", "Peek &declaration", "Peek declaration", "<silent>", '<S-F1>', '<Cmd>lua require("goto-preview").goto_preview_declaration()<CR>', "<fnalias>", "")
call roarie_commands#AddMapping("&Document", "find_all_refs", "Find all &references", "Find all LSP references", "<silent>", '<C-F1>', '<Cmd>lua vim.lsp.buf.references()<CR>', "<fnalias>", "")
call roarie_commands#AddMapping("&Document", "goto_define", "Go to &definition", "Go to definition", "<silent>", '<F2>', '<Cmd>lua vim.lsp.buf.definition()<CR>', "<fnalias>", "")
call roarie_commands#AddMapping("&Document", "goto_decl", "Go to de&claration", "Go to declaration", "<silent>", '<S-F2>', '<Cmd>lua vim.lsp.buf.declaration()<CR>', "<fnalias>", "")
call roarie_commands#AddMapping("&Document", "edit_file_under_cursor", "Go &to file under cursor", "Edit the file whose name is under or after the cursor", '<silent>', '<C-F2>', 'gf<CR>', "<fnalias>", "")
else
call roarie_commands#AddMapping("&Document", "peek_define", "Peek &definition", "Peek definition", "<silent>", '<F1>', ':<C-U>LspPeekDefinition<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Document", "find_all_refs", "Find all &references", "Find all LSP references", "<silent>", '<C-F1>', ':<C-U>LspReferences<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Document", "peek_decl", "Peek de&claration", "Peek declaration", "<silent>", '<S-F1>', ':<C-U>LspPeekDeclaration<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Document", "goto_define", "Go to &definition", "Go to definition", "<silent>", '<F2>', ':<C-U>LspDefinition<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Document", "goto_decl", "Go to de&claration", "Go to declaration", "<silent>", '<S-F2>', ':<C-U>LspDeclaration<CR>', "<fnalias>")
endif
call roarie_commands#AddSeparator("&Document")
if has('nvim')
call roarie_commands#AddMapping("&Document", "document_symbols", "Document &symbols picker...", "Telescope document_symbols/aerial...", "<silent>", '<F3>', ':<C-U>lua if (table.getn(vim.lsp.get_clients({bufnr=vim.api.nvim_get_current_buf()})) == 0) then require("telescope").extensions.aerial.aerial() else require("telescope.builtin").lsp_document_symbols() end<CR>', "<fnalias>", "󱔁")
call roarie_commands#AddMapping("&Document", "workspace_symbols", "Workspace &symbols picker...", "Telescope lsp_dynamic_workspace_symbols...", "<silent>", '<S-F3>', '<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>', "<fnalias>", "")
call roarie_commands#AddMapping("&Document", "toggle_symbols_sidebar", "Toggle &symbols sidebar", "Toggle Aerial sidebar", "<silent>", '<C-F3>', ':<C-U>AerialToggle left<CR>', "<fnalias>", "ﯼ")
call roarie_commands#AddMapping("&Document", "toggle_symbols_float", "Toggle &symbols window", "Toggle Aerial nav window", "<silent>", '<C-S-F3>', ':<C-U>AerialNavToggle<CR>', "<fnalias>", "")
call roarie_commands#AddSeparator("&Document")
call roarie_commands#AddMapping("&Document", "document_diagnostics", "Dia&gnostics picker...", "Telescope diagnostics...", "<silent>", '<M-S-F3>', ':<C-U>Telescope diagnostics<CR>', "<fnalias>", "ﱥ")
call roarie_commands#AddMapping("&Document", "goto_diag_next", "Go to next diagn&ostic", "Go to next diagnostic in file", "<silent>", '<C-PageDown>', '<Cmd>lua vim.diagnostic.goto_next({severity={min=vim.diagnostic.severity.HINT, max=vim.diagnostic.severity.WARN}, wrap = true})<CR>', "", "")
call roarie_commands#AddMapping("&Document", "goto_diag_prev", "Go to previous diagn&ostic", "Go to previous diagnostic in file", "<silent>", '<C-PageUp>', '<Cmd>lua vim.diagnostic.goto_prev({severity={min=vim.diagnostic.severity.HINT, max=vim.diagnostic.severity.WARN}, wrap = true})<CR>', "", "")
call roarie_commands#AddMapping("&Document", "goto_error_next", "Go to next &error", "Go to next error in file", "<silent>", '<C-S-PageDown>', '<Cmd>lua vim.diagnostic.goto_next({severity={min=vim.diagnostic.severity.ERROR, max=vim.diagnostic.severity.ERROR}, wrap = true})<CR>', "", "")
call roarie_commands#AddMapping("&Document", "goto_error_prev", "Go to previous &error", "Go to previous error in file", "<silent>", '<C-S-PageUp>', '<Cmd>lua vim.diagnostic.goto_prev({severity={min=vim.diagnostic.severity.ERROR, max=vim.diagnostic.severity.ERROR}, wrap = true})<CR>', "", "")
else
call roarie_commands#AddMapping("&Document", "search_document_symbols", "Search document &symbols...", "Search the symbols for the current document and navigate", "<silent>", '<F3>', ':<C-U>LspDocumentSymbolSearch<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Document", "search_workspace_symbols", "Search &workspace symbols...", "Search the workspace symbols for all servers and navigate using quickpick", "<silent>", '<S-F3>', ':<C-U>LspWorkspaceSymbolSearch<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Document", "goto_diag_next", "Go to &next diagnostic", "Go to next diagnostic in file", "<silent>", '<C-PageDown>', ':<C-U>LspNextDiagnostic<CR>')
call roarie_commands#AddMapping("&Document", "goto_diag_prev", "Go to &previous diagnostic", "Go to previous diagnostic in file", "<silent>", '<C-PageUp>', ':<C-U>LspPreviousDiagnostic<CR>')
endif
call roarie_commands#AddSeparator("&Document")
if has('nvim')
call roarie_commands#AddMapping("&Document", "display_hover", "Display &hover information", "Get hover information & display in preview-window", "<silent>", '<F4>', '<Cmd>lua vim.lsp.buf.hover()<CR>', "<fnalias>", "")
call roarie_commands#AddMapping("&Document", "code_action", "Code act&ion...", "Code action...", "<silent>", '<S-F4>', '<Cmd>lua vim.lsp.buf.code_action()<CR>', "<fnalias>", "")
else
call roarie_commands#AddMapping("&Document", "display_hover", "Display &hover information", "Get hover information & display in preview-window", "<silent>", '<F4>', ':<C-U>LspHover<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Document", "code_action", "Code act&ion...", "Code action...", "<silent>", '<S-F4>', ':<C-U>LspCodeAction<CR>', "<fnalias>")
endif
call roarie_commands#AddMapping("&Document", "display_man_prompt", "Display &manual page...", "Display manual page prompt", "", '<C-F4>', ':<C-U>Man ', "<fnalias>", "󰋖")
call roarie_commands#AddMapping("&Document", "display_man", "Display &manual page", "Display manual page from current word", "<silent>", '<C-S-F4>', '"zyiw:exe "Man ".@z.""<CR>', "<fnalias>", "ﲉ")
if has('nvim')
call roarie_commands#AddMapping("&Document", "search_man_pages", "&Man_pages picker...", "Telescope man_pages...", '<silent>', '<M-S-F4>', ':<C-U>lua require("telescope.builtin").man_pages({sections = {"ALL"}})<CR>', "<fnalias>", "ﯳ")
endif
if !has('nvim')
call roarie_commands#AddSeparator("&Document")
call roarie_commands#AddMapping("&Document", "quickfix_window", "&QuickFix window...", "Toggle the QuickFix window given recognised errors", "<silent>", '<M-F8>', ':<C-U>ToggleQuickFix<CR>', "<fnalias>")
endif

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0

lua << EOF
lazy_plugins["aerial.nvim"] = {
config = function()
	require("aerial").setup({
		-- Priority list of preferred backends for aerial.
		-- This can be a filetype map (see :help aerial-filetype-map)
		-- backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },
		backends = {
			['_'] = {"treesitter", "lsp", "markdown", "asciidoc", "man"},
			c = {"lsp", "treesitter"},
			cpp = {"lsp", "treesitter"},
		},

		-- A list of all symbols to display. Set to false to display all symbols.
		-- This can be a filetype map (see :help aerial-filetype-map)
		-- To see all available values, see :help SymbolKind
		-- filter_kind = {
		-- 	"Class",
		-- 	"Constructor",
		-- 	"Enum",
		-- 	"Function",
		-- 	"Interface",
		-- 	"Module",
		-- 	"Method",
		-- 	"Struct",
		-- },
		filter_kind = false,

		-- Determines how the aerial window decides which buffer to display symbols for
		--   window - aerial window will display symbols for the buffer in the window from which it was opened
		--   global - aerial window will display symbols for the current window
		-- attach_mode = "window",
		attach_mode = "global",

		-- Determines where the aerial window will be opened
		--   edge   - open aerial at the far right/left of the editor
		--   window - open aerial to the right/left of the current window
		-- placement = "window",
		placement = "edge",

		-- Use symbol tree for folding. Set to true or false to enable/disable
		-- Set to "auto" to manage folds if your previous foldmethod was 'manual'
		-- This can be a filetype map (see :help aerial-filetype-map)
		manage_folds = false,

		-- When you fold code with za, zo, or zc, update the aerial tree as well.
		-- Only works when manage_folds = true
		link_folds_to_tree = false,

		-- Fold code when you open/collapse symbols in the tree.
		-- Only works when manage_folds = true
		link_tree_to_folds = false,

		-- Show box drawing characters for the tree hierarchy
		show_guides = true,

		-- Call this function each time aerial sets symbols on a buffer.
		-- If Aerial falls back from one backend to another, this function
		-- will be called each time, whereas on_first_symbols will only be
		-- called once.
		on_set_symbols = function(bufnr)
			require("aerial").tree_set_collapse_level(bufnr, 0)
		end,
	})

	local telescope = require("telescope")
	telescope.load_extension 'aerial'
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0

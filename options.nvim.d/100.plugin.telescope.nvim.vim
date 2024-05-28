lua << EOF
lazy_plugins["telescope.nvim"] = {
config = function()
	local telescope = require("telescope")
	local actions = require("telescope.actions")

	telescope.setup {
		-- {{{ defaults = {}
		defaults = {
		-- {{{ default_mappings = {}
		-- telescope.nvim/lua/telescope/mappings.lua:133...
		default_mappings = {
    i = {
      ["<LeftMouse>"] = {
        actions.mouse_click,
        type = "action",
        opts = { expr = true },
      },
      ["<2-LeftMouse>"] = {
        actions.double_mouse_click,
        type = "action",
        opts = { expr = true },
      },

      ["<C-n>"] = actions.move_selection_next,
      ["<C-p>"] = actions.move_selection_previous,

      ["<C-c>"] = actions.close,

      ["<Down>"] = actions.move_selection_next,
      ["<Up>"] = actions.move_selection_previous,

      ["<CR>"] = actions.select_default,
      ["<C-x>"] = actions.select_horizontal,
      ["<C-v>"] = actions.select_vertical,
      ["<C-t>"] = actions.select_tab,

      --["<C-u>"] = actions.preview_scrolling_up,
      ["<C-d>"] = actions.preview_scrolling_down,
      ["<C-f>"] = actions.preview_scrolling_left,
      ["<C-k>"] = actions.preview_scrolling_right,

      ["<PageUp>"] = actions.results_scrolling_up,
      ["<PageDown>"] = actions.results_scrolling_down,
      ["<M-f>"] = actions.results_scrolling_left,
      ["<M-k>"] = actions.results_scrolling_right,

      ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
      ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
      ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
      ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      ["<C-l>"] = actions.complete_tag,
      ["<C-/>"] = actions.which_key,
      ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      ["<C-w>"] = { "<c-s-w>", type = "command" },
      ["<C-r><C-w>"] = actions.insert_original_cword,

      -- disable c-j because we dont want to allow new lines #2123
      ["<C-j>"] = actions.nop,
    },
    n = {
      ["<LeftMouse>"] = {
        actions.mouse_click,
        type = "action",
        opts = { expr = true },
      },
      ["<2-LeftMouse>"] = {
        actions.double_mouse_click,
        type = "action",
        opts = { expr = true },
      },

      ["<esc>"] = actions.close,
      ["<CR>"] = actions.select_default,
      ["<C-x>"] = actions.select_horizontal,
      ["<C-v>"] = actions.select_vertical,
      ["<C-t>"] = actions.select_tab,

      ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
      ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
      ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
      ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

      -- TODO: This would be weird if we switch the ordering.
      ["j"] = actions.move_selection_next,
      ["k"] = actions.move_selection_previous,
      ["H"] = actions.move_to_top,
      ["M"] = actions.move_to_middle,
      ["L"] = actions.move_to_bottom,

      ["<Down>"] = actions.move_selection_next,
      ["<Up>"] = actions.move_selection_previous,
      ["gg"] = actions.move_to_top,
      ["G"] = actions.move_to_bottom,

      --["<C-u>"] = actions.preview_scrolling_up,
      ["<C-d>"] = actions.preview_scrolling_down,
      ["<C-f>"] = actions.preview_scrolling_left,
      ["<C-k>"] = actions.preview_scrolling_right,

      ["<PageUp>"] = actions.results_scrolling_up,
      ["<PageDown>"] = actions.results_scrolling_down,
      ["<M-f>"] = actions.results_scrolling_left,
      ["<M-k>"] = actions.results_scrolling_right,

      ["?"] = actions.which_key,
    },
			},
			-- }}}

			mappings = {
				i = {
					["<C-Up>"] = actions.cycle_history_prev,
					["<C-Down>"] = actions.cycle_history_next,

					["<C-Left>"] = actions.preview_scrolling_left,
					["<C-Right>"] = actions.preview_scrolling_right,
					["<C-PageDown>"] = actions.preview_scrolling_down,
					["<C-PageUp>"] = actions.preview_scrolling_up,

					["<M-Left>"] = actions.results_scrolling_left,
					["<M-Right>"] = actions.results_scrolling_right,
				},
				n = {
					["<C-Up>"] = actions.cycle_history_prev,
					["<C-Down>"] = actions.cycle_history_next,

					["<C-Left>"] = actions.preview_scrolling_left,
					["<C-Right>"] = actions.preview_scrolling_right,
					["<C-PageDown>"] = actions.preview_scrolling_down,
					["<C-PageUp>"] = actions.preview_scrolling_up,

					["<M-Left>"] = actions.results_scrolling_left,
					["<M-Right>"] = actions.results_scrolling_right,
				},
			},
			path_display = { shorten = 10, },
			sorting_strategy = "ascending",
		},
		-- }}}
		extensions = {
			-- {{{ extensions["ui-select"] = {}
			["ui-select"] = {
				require("telescope.themes").get_dropdown {
				},
			},
			-- }}}
			-- {{{ extensions.menufacture = {}
			menufacture = {
				max_depth_initial = 4,
				mappings = {
					main_menu = { [{ 'i', 'n' }] = '<C-^>' },
					change_into_directory = { i = '<C-d>' },
					change_into_parent_directory = { i = '<C-p>' },
					decrease_maximum_depth = { i = '<M-->' },
					increase_maximum_depth = { i = '<M-=>' },
					decrease_path_shorten = { i = '<C-[>' },
					increase_path_shorten = { i = '<C-]>' },
					live_grep_here = { i = '<C-g>' },
					toggle_hidden = { i = '<C-h>' },
					toggle_wrap = { i = '<C-p>' },
				},
			},
			-- }}}
			-- {{{ extensions.file_browser = {}
			file_browser = {
				theme = "ivy",

				-- disables netrw and use telescope-file-browser in its place
				hijack_netrw = true,

				mappings = {
					["i"] = {},
					["n"] = {},
				},
			},
			-- }}}
		},
		-- {{{ pickers = {}
		pickers = {
			find_files = { prompt_title = "Files (<C-/> help <C-^> opts)", },
			live_grep = { prompt_title = "Grep (<C-/> help <C-^> opts)", },
		},
		-- }}}
	}

	vim.cmd('highlight TelescopeBorder guifg=#0679a5 guibg=#30303')
	vim.cmd('highlight TelescopeMatching gui=underline')
	vim.cmd('highlight TelescopePromptTitle guifg=#f5a9b8')
	vim.cmd('highlight TelescopeSelection guifg=#303030 guibg=#f5a9b8')
	vim.cmd('highlight TelescopeTitle guifg=#f5a9b8')
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0

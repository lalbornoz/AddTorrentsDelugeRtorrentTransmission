lua << EOF
lazy_plugins["telescope-menufacture"] = {
config = function()
	local telescope = require("telescope")
	local menufacture = telescope.extensions.menufacture

	-- To get telescope-menufacture loaded and working with telescope,
	-- you need to call load_extension:
	telescope.load_extension 'menufacture'

	menufacture.defaults = {}

	menufacture.defaults.find_files = function(opts)
		opts = vim.tbl_deep_extend('force', opts or {}, {
			hidden=false,
			max_depth=nil,
			find_command=get_find_command({}),
			ignore_gitdir_state=true,
			file_ignore_patterns = {'^%.git/'},
		})
		menufacture.find_files(opts)
	end

	menufacture.defaults.live_grep = function(opts)
		opts = vim.tbl_deep_extend('force', opts or {}, {
			additional_args={'--hidden'}, ['flag_additional_args--hidden']=true,
			file_ignore_patterns = {'^%.git/'},
			hidden=true,
			ignore_gitdir_state=true,
			max_depth=nil,
		})
		menufacture.live_grep(opts)
	end

	menufacture.defaults.live_grep_buffer = function(opts)
		opts = vim.tbl_deep_extend('force', opts or {}, {
			path_display="hidden",
			search_dirs={"%:p"},
		})
		menufacture.live_grep(opts)
	end
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0

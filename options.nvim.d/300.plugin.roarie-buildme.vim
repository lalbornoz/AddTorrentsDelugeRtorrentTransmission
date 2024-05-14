lua << EOF
lazy_plugins["roarie-buildme"] = {
config = function()
	require("roarie-buildme").setup({
		buildfile = '.buildme.sh',		-- the build file to execute
		runfile = '.runme.sh',			-- the run file to execute
		close_build_on_exit = 'on_success',	-- close build window on exit: never, on_error, on_success, always
		close_run_on_exit = 'on_success',	-- close run window on exit: never, on_error, on_success, always
		edit_on_nonexistent = false,		-- edit non-existent build/run file on build/run
		interpreter = 'sh',			-- the interpreter to use (sh, bash, python, ...)
		force = '',	 			-- the option to pass when the bang is used
		save_current_wd = true,			-- save working directory of editor at startup; used to look for {build,run}file
		wincmd = 'split',			-- a command to run prior to a build job (split, vsplit, ...)
	})
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0

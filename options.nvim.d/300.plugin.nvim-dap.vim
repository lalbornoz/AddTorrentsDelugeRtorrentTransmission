lua << EOF
lazy_plugins["nvim-dap"] = {
config = function()
	local dap = require("dap")

	--
	-- (as per <https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(gdb-via--vscode-cpptools)>)
	--

	dap.adapters.cppdbg = {
		command = vim.fn.expand("~/.local/libexec/cpptools-linux/extension/debugAdapters/bin/OpenDebugAD7"),
		id	= "cppdbg",
		type	= "executable",
	}

	-- {{{ dap.configurations.cpp = {}
	dap.configurations.cpp = {
		{
			cwd			= '${workspaceFolder}',
			miDebuggerPath		= "/usr/bin/gdb",
			miDebuggerServerAddress	= "localhost:1234",
			MIMode			= "gdb",
			name			= "Debug via .gdbme.sh",
			request			= "launch",
			type			= "cppdbg",
			program			=
			function()
				local program = nil

				if vim.fn.exists(".gdbme.sh") then
					local obj_program = vim.system(
						{"/bin/sh", ".gdbme.sh", "--print-program"},
						{text=true}):wait()

					if obj_program.code == 0 then
						local obj_server = vim.system(
							{"/bin/sh", ".gdbme.sh", "--start-server"},
							{text=true}):wait()

						if obj_server.code == 0 then
							program = obj_program.stdout
						end
					end
				end

				if program == nil then
					program = vim.fn.input(
						"Path to executable: ",
						vim.fn.getcwd() .. "/", "file")
				end

				return program
			end,
		},
	}
	-- }}}

	dap.configurations.c = dap.configurations.cpp

	dap.roarie = {}
	dap.roarie.continue = function()
		if dap.status() == "" then
			dap.continue()
			require("dapui").open()
		else
			dap.continue()
		end
	end
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0

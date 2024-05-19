lua << EOF
lazy_plugins["nvim-dap"] = {
config = function()
	local dap = require("dap")

	dap.configurations.cpp = {
		{
			cwd		= '${workspaceFolder}',
			name		= "Launch file",
			request		= "launch",
			stopAtEntry	= true,
			type		= "cppdbg",
			program		=
			function()
				return vim.fn.input(
					"Path to executable: ",
					vim.fn.getcwd() .. "/", "file")
			end,
		},

		{
			cwd			= '${workspaceFolder}',
			miDebuggerPath		= "/usr/bin/gdb",
			miDebuggerServerAddress	= "localhost:1234",
			MIMode			= "gdb",
			name			= "Attach to gdbserver :1234",
			request			= "launch",
			type			= "cppdbg",
			program			=
			function()
				return vim.fn.input(
					"Path to executable: ",
					vim.fn.getcwd() .. "/", "file")
			end,
		},
	}

	dap.adapters.cppdbg = {
		command = vim.fn.expand("~/.local/libexec/cpptools-linux/extension/debugAdapters/bin/OpenDebugAD7"),
		id	= "cppdbg",
		type	= "executable",
	}

	dap.configurations.c = dap.configurations.cpp
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0

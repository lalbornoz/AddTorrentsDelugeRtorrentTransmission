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
			cwd		= '${workspaceFolder}',
			name		= "Launch file",
			request		= "launch",
			stopAtEntry	= true,
			type		= "cppdbg",
			program		=
			function()
				local program = nil

				if vim.fn.exists(".gdbme.sh") then
					local obj_program = vim.system(
						{"/bin/sh", ".gdbme.sh", "--print-program"},
						{text=true}):wait()

					if obj_program.code == 0 then
						program = obj_program.stdout
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

	dap.roarie.sidebars = {
		expression={sidebar=nil, winopts={width=25}, wincmd="vsplit"},
		frames={sidebar=nil, winopts={height=8}, wincmd="belowright split"},
		scopes={sidebar=nil, winopts={width=25}, wincmd="vsplit"},
		sessions={sidebar=nil, winopts={height=8}, wincmd="belowright split"},
		threads={sidebar=nil, winopts={height=8}, wincmd="belowright split"},
	}

	dap.roarie.toggle = function(kind, winopts, wincmd)
  		local widgets = require("dap.ui.widgets")
		if dap.roarie.sidebars[kind].sidebar == nil then
			dap.roarie.sidebars[kind].sidebar =
				widgets.sidebar(
					widgets[kind],
					winopts or dap.roarie.sidebars[kind].winopts,
					wincmd or dap.roarie.sidebars[kind].wincmd)
		end
		dap.roarie.sidebars[kind].sidebar.toggle()
	end

	dap.roarie.toggle_default = function()
		dap.roarie.toggle("frames")
		dap.roarie.toggle("scopes")
	end
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0

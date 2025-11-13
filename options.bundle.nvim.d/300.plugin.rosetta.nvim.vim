lua << EOF
lazy_plugins["rosetta.nvim"] = {
config = function()
	require("rosetta").setup({
		bidi = {
			enabled = true,
			user_commands = true, -- Generate usercommands for bidi functions.
			intuitive_delete = true, -- Swap `Delete` and `Backspace` keys in insert mode for RTL languages in a bidi buffer.
			register = "b", -- Register which will paste bidi content.
			revert_before_saving = true, -- Disable bidi-mode before saving buffer contents.
		},
		keyboard = {
			enabled = true,
			user_commands = true, -- Generate usercommands for keyboard functions.
			silent = false, -- Notify the user when keyboard is switched.
		},
		lang = { -- Place language instances here.
			default = "english", -- Default language specified.
			english = {
				keymap = "",
				rtl = false,
				unicode_range = { "0020-007F" },
			},
			arabic = {
				keymap = "arabic_utf-8",
				rtl = true,
				unicode_range = { "0600-06FF", "0750-077F", "0870-089F", "08A0-08FF", "FB50-FDFF", "FE70-FEFF" },
				options = {
					delcombine = true,
				}
			},
		},
	})
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0

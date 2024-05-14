lua << EOF
lazy_plugins["nvim-cmp"] = {
config = function()
	-- Set up nvim-cmp.
	local cmp = require'cmp'

	cmp.setup({
		completion = {
			autocomplete = false
		},
		window = {
			-- completion = cmp.config.window.bordered(),
			-- documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
			['<C-b>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<S-Tab>'] = cmp.mapping.select_next_item(),
			['<C-Tab>'] = cmp.mapping.complete(),
			['<C-e>'] = cmp.mapping.abort(),
			['<Space>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),
		sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
		}, {
			{ name = 'buffer' },
		})
	})

	-- Set up lspconfig.
	local capabilities = require('cmp_nvim_lsp').default_capabilities()
	require('lspconfig')['clangd'].setup {
		capabilities = capabilities
	}
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0

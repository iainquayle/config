return {
	{
		'williamboman/mason.nvim',
		cmd = 'Mason',
		config = function()
			if os.getenv("NIXOS") ~= '1' then
				require('mason').setup()
			end
		end
	},
	{
		'williamboman/mason-lspconfig.nvim',
		config = function()
			if os.getenv("NIXOS") ~= '1' then
				require('mason-lspconfig').setup({
					handlers = {
						function(server_name)
							require('lspconfig')[server_name].setup({})
						end
					},
				})
			end
		end
	}
}

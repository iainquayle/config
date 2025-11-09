local function on_attach(client, bufnr)
	--vim.lsp.buf.defaults.set_keymaps(bufnr)

	local opts = { noremap = true, silent = true, buffer = bufnr}
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover({ border = "rounded" })
	end, {
		desc = "Show documentation",
		buffer = bufnr,
	})
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true })
	--vim.keymap.set({"n", "x"}, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", opts)
	--vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	--[[
	  map('n', 'gD', vim.diagnostic.setqflist, 'LSP open diagnostics quick fix list')
	  map('n', 'gl', vim.diagnostic.open_float, 'LSP show line diagnostics')
	  map('n', ']d', vim.diagnostic.goto_next, 'LSP goto next diagnostic')
	  map('n', '[d', vim.diagnostic.goto_prev, 'LSP goto previous diagnostic')
	 --]]

	if client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint.enable(true, {bufnr=bufnr})
	end
end

local function lsp_setup()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

	vim.lsp.config("*", {
		capabilities=capabilities,
		on_attach=on_attach,
	})
end

-- switch on whether to use mason or not
-- multiple modules returned based on either need 
if true or os.getenv("NIXOS") == '1' or os.getenv("MASON") ~= '1' then
	return {
		{
			"neovim/nvim-lspconfig",
			--event = "VeryLazy",
			lazy = false,
			config = function()
				lsp_setup()

				vim.lsp.config("lua_ls", {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						}
					}
				})
				vim.lsp.config("elixirls", {cmd = { "elixir-ls" }})
				vim.lsp.config("pyright", {
					on_attach = on_attach
				})

				--lspconfig.ts_ls.setup({})
				vim.lsp.enable("lua_ls")
				vim.lsp.enable("clangd")
				vim.lsp.enable("elixirls")
				vim.lsp.enable("rust_analyzer")
				vim.lsp.enable("gopls")
				vim.lsp.enable("nil_ls")
				vim.lsp.enable("pyright")
			end
		},
		{
			"pmizio/typescript-tools.nvim",
			dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
			opts = {},
		}
	}
else
	--currently setup such that this wont run
	--going to move away from mason
	return {
		{
			"neovim/nvim-lspconfig",
			event = "VeryLazy",
			dependencies = { { "williamboman/mason-lspconfig.nvim", dependencies = { "williamboman/mason.nvim", } } },
			config = function() lsp_setup() end
		},
		{
			'williamboman/mason.nvim',
			event = "VeryLazy",
			cmd = 'Mason',
			config = function() require('mason').setup() end
		},
		{
			'williamboman/mason-lspconfig.nvim',
			event = "VeryLazy",
			config = function()
				require('mason-lspconfig').setup({
					handlers = {
						function(server_name)
							require('lspconfig')[server_name].setup({})
						end
					},
				})
			end
		}
	}
end

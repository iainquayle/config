return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		{'williamboman/mason.nvim'},
		{'williamboman/mason-lspconfig.nvim'},
		{'neovim/nvim-lspconfig'},
		{'hrsh7th/cmp-nvim-lsp'},
		{'hrsh7th/nvim-cmp'},
		--{'L3MON4D3/LuaSnip'},
	},
	config = function()
		local lsp_zero = require("lsp-zero")

		lsp_zero.on_attach(function(client, bufnr)
			-- see :help lsp-zero-keybindings
			-- to learn the available actions
			lsp_zero.default_keymaps({buffer = bufnr})
		end)

		-- see :help lsp-zero-guide:integrate-with-mason-nvim
		-- to learn how to use mason.nvim with lsp-zero
		require('mason').setup({
		})
		require('mason-lspconfig').setup({
			handlers = {
				lsp_zero.default_setup,
				html = function()
					require('lspconfig').html.setup({
						on_attach = on_attach,
						capabilities = capabilities,
						filetypes = { "html", "templ" },
					})
				end,
			},
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"pyright",
				"jdtls",
				--"texlab",
				"tsserver",
				"gopls",
				"html",
				--"htmx",
				"cssls",
				"nil_ls",
				--"clangd",
				--"templ",
				"elixirls",
			},
			automatic_installation=true,
		})


		local cmp = require("cmp")
		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				--["<C-b>"] = cmp.mapping.scroll_docs(-4),
				--["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				--["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<C-l>"] = cmp.mapping.confirm({ select = false }),
			})
		})
	end,
}


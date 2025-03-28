return {
	"neovim/nvim-lspconfig",
	--[[
	dependencies = {
		{
			"williamboman/mason-lspconfig.nvim",
			dependencies = { "williamboman/mason.nvim", }
		}
	},
	--]]
	config = function()
		local lsp_defaults = require("lspconfig").util.default_config
		lsp_defaults.capabilities = vim.tbl_extend(
			"force",
			lsp_defaults.capabilities,
			require("cmp_nvim_lsp").default_capabilities()
		)

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP Actions",
			callback = function(event)
				local opts = { buffer = event.buf }

				vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
				vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
				vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
				vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
				vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
				vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
				vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
				--vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
				--vim.keymap.set({"n", "x"}, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", opts)
				--vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
				--[[
				  map('n', 'gD', vim.diagnostic.setqflist, 'LSP open diagnostics quick fix list')
				  map('n', 'gl', vim.diagnostic.open_float, 'LSP show line diagnostics')
				  map('n', ']d', vim.diagnostic.goto_next, 'LSP goto next diagnostic')
				  map('n', '[d', vim.diagnostic.goto_prev, 'LSP goto previous diagnostic')
				  --]]
			end,
		})

		if os.getenv("NIXOS") == '1' then
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
		end
	end
}

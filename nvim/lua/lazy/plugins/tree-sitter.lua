return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	event = {"BufReadPre", "BufNewFile"},
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = {
				enable = true,
			},
			indent = { enable = true },
			autotag = { enable = true, },
			--should have cli installed for this
			--autoinstall = true,
			ensure_installed = {
				--"latex",
				"rust",
				"python",
				"go",
				"java",
				"json",
				"typescript",
				"javascript",
				"tsx",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"svelte",
				"lua",
				"gitignore",
				"cpp",
				"hlsl",
				"glsl",
				"wgsl",
				--"templ",
				"nix",
				"elixir",
				"erlang",
				"eex",
				"heex",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			-- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
			--[[
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
			]]--
		})
	end,
}

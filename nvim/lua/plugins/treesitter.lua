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
				disable = {"latex"},
			},
			--indent = { enable = true },
			autotag = { enable = true, },
			autoinstall = true,
			ensure_installed = {
				"rust",
				"python",
				"go",
				"json",
				"typescript",
				"javascript",
				"tsx",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"lua",
				"gitignore",
				"cpp",
				"glsl",
				"wgsl",
				"nix",
				"elixir",
				"erlang",
				"eex",
				"heex",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<M-v>",
					node_incremental = "<M-v>",
					scope_incremental = false,
					node_decremental = "<M-V>",
				},
			},
		})
	end,
}

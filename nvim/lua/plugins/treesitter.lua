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
				"yaml",
				"toml",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<leader>v",
					node_decremental = ",",
					node_incremental = ".",
					scope_incremental = false,
				},
			},
		})
	end,
}

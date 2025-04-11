return {
	"folke/snacks.nvim",
	enabled = false,
	priority = 1000,
	lazy = false,
	opts = { },
	keys = {
		{"<leader>zz", function() Snacks.terminal() end, desc = "Snacks toggle terminal"},
	}
}

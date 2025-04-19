return {
	"folke/snacks.nvim",
	enabled = false,
	priority = 1000,
	lazy = false,
	opts = { },
	keys = {
		{"<M-t>", function() Snacks.terminal() end, desc = "Snacks toggle terminal"},
	}
}

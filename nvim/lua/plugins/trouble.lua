return {
	"folke/trouble.nvim",
	event = "VeryLazy",
	opts = {},
	cmd = "Trouble",
	keys = {
		{
			"<leader>tt",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Trouble diagnostics",
		},
	}
}

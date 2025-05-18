return {
	"zbirenbaum/copilot.lua",
	--enabled = false,
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			panel = {enabled = false,
				auto_refresh = false,
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<M-l>",
					next = "<M-j>",
					prev = "<M-k>",
					accept_word = "<M-h>",
				},
			},
			filetypes = {
				["*"] = true,
			},
		})
	end,
}

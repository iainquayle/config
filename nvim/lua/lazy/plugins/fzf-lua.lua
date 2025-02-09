return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons", },
	opts = { },
	config = function ()
		local fzf = require("fzf-lua")

		local keymap = vim.keymap 
		keymap.set("n", "<leader>ff",  fzf.files, { desc = "Find files" })
		--keymap.set("n", "<leader>fr",  fzf.oldfiles, { desc = "Fuzzy find recent" })

		keymap.set("n", "<leader>ft",  fzf.treesitter, { desc = "Find treesitter nodes" })
		keymap.set("n", "<leader>fs",  fzf.lsp_live_workspace_symbols, { desc = "Find lsp symbols" })
		keymap.set("n", "<leader>fr",  fzf.lsp_references, { desc = "Find symbol references" })

		keymap.set("n", "<leader>fg",  fzf.live_grep, { desc = "Grep for string" })
		keymap.set("n", "<leader>fG",  fzf.lgrep_curbuf, { desc = "Grep for string in buffer" })
		keymap.set("n", "<leader>fd",  fzf.diagnostics_workspace, { desc = "Find diagnostics" })

		keymap.set("n", "<leader>fc",  fzf.builtin, { desc = "Find fzf commands" })
	end
}

return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		vim.keymap.set({"n", "v"}, "<leader>ca", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
		vim.keymap.set({"n", "v"}, "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })

		vim.cmd([[cab cc CodeCompanion]])

		require("codecompanion").setup({
			display = {
				chat = {
					show_settings = true
				}
			},
			strategies = {
				chat = {
					adapter = "gemini",
					keymaps = {
						send = {
							modes = { n = "<CR>", v = "<M-CR>" }
						},
						close = {
							modes = { n = "q" }
						},
						stop = {
							modes = { n = "<M-q>" }
						}
					},
					slash_commands = {
						["file"] = {
							callback = "strategies.chat.slash_commands.file",
							description = "Open a file",
							opts = {
								provider = "fzf_lua",
								contains_code = true,
							}
						}
					}
				},
				inline = {
					adapter = "gemini",
					keymaps = {
						--accept_change = { n = "<" }
					},
				},
				cmd = {
					adapter = "gemini",
				},
			},
			adapters = {
				gemini = function()
					return require("codecompanion.adapters").extend("gemini", {
						schema = {
							model = {
								--default = "gemini-2.5-pro-exp-03-25"
								default = "gemini-2.0-flash"
								--default = "gemini-1.5-pro"
							}
						},
						env = {
							api_key = "cmd:secret-tool lookup api-key gemini"
						}
					})
				end
			}
		})
	end,
}

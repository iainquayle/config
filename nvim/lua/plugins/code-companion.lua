return {
	"olimorris/codecompanion.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		vim.keymap.set({"n", "v"}, "<leader>ca", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true, desc = "CodeCompanion Actions" })
		vim.keymap.set({"n", "v"}, "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true, desc = "CodeCompanion chat" })

		vim.cmd([[cab cc CodeCompanion]])

		require("codecompanion").setup({
			display = {
				chat = {
					show_settings = false,
					window = {
						layout = "float",
						height = 0.95,
						width = 0.9,
						opts = {
							wrap = true,
						}
					},
				},
				diff = {
					provider = "mini_diff"
				},
			},
			strategies = {
				chat = {
					adapter = {
						name = "ollama",
						model = "deepseek-r1:14b",
					},
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
				http = {
					gemini = function()
						return require("codecompanion.adapters").extend("gemini", {
							schema = {
								model = {
									--default = "gemini-2.5-pro-exp-03-25"
									default = "gemini-2.5-flash-preview-05-20"
								}
							},
							env = {
								api_key = "cmd:secret-tool lookup api-key gemini"
							}
						})
					end,
					ollama = function()
						return require("codecompanion.adapters").extend("ollama", {
							schema = {
								model = {
									default = "deepseek-r1:14b"
								}
							},
						})
					end,
				}
			}
		})
	end,
}

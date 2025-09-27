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
				--	provider = "mini_diff"
					provider_opts = {
						inline = {
							layout = "float"
						}
					}
				},
			},
			strategies = {
				chat = {
					adapter = {
						name = "ollama",
						model = "gpt-oss:20b",
						--name = "gemini",
						--model = "gemini-2.5-flash",
					},
					keymaps = {
						send = {
							modes = { n = "<CR>", v = "<M-CR>" }
						},
						close = {
							modes = {
								n = "cq"
							}
						},
						stop = {
							modes = {
								n = "cs"
							}
						}
					},
					opts = {
						completion_provider = "cmp"
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
					adapter = {
						name = "ollama",
						model = "gpt-oss:20b"
					},
					keymaps = {
						accept_change = {
							modes = { n = "ca" }
						},
						reject_change = {
							modes = { n = "cr" }
						}
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
									default = "gemini-2.5-flash"
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
									--default = "deepseek-r1:14b"
									--default = "devstral:24b"
									default = "gpt-oss:20b"
								}
							},
						})
					end,
				}
			}
		})
	end,
}

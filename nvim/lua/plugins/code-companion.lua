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

		-- change logic, 
		-- check for available connection via vpn
		-- check local and capabilities
		-- 	decide on check for gemini or other model, otherwise use local
		-- 	otherwise none available and maybe disable entirely?

		local ollama_url = "http://strix.netbird.cloud:21339"
		--[[local ollama_check_handle = io.popen("ollama -v", "r")
		if ollama_check_handle then
			local _, _, exit_code = ollama_check_handle:close()
			if exit_code == 0 then
				ollama_url = "http://localhost:11434"
			end
		end]]--

		require("codecompanion").setup({
			display = {
				action_palette = {
					provider = "fzf_lua"
				},
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
					enabled = true,
					provider_opts = {
						inline = {
							layout = "float"
						}
					}
				},
			},
			interactions = {
				chat = {
					--adapter = {
					--	name = "ollama",
					--},
					adapter = "ollama",
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
							opts = {
								provider = "fzf_lua",
							}
						}
					}
				},
				inline = {
					adapter = {
						name = "ollama",
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
					adapter = {
						name = "ollama",
					},
				},
			},
			adapters = {
				http = {
					gemini = function()
						return require("codecompanion.adapters").extend("gemini", {
							schema = {
								model = {
									default = "gemini-3.0-flash"
								}
							},
							env = {
								api_key = "cmd:secret-tool lookup api-key gemini"
							}
						})
					end,
					ollama = function()
						return require("codecompanion.adapters").extend("ollama", {
							name = "ollama",
							env = {
								url = ollama_url,
							},
							schema = {
								model = {
									default = "glm-4.7-flash",
								},
								num_ctx = {
									default = 64000,
								}
							},
						})
					end,
				}
			}
		})
	end,
}

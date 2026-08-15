return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	event = {"BufReadPre", "BufNewFile"},
	build = ":TSUpdate",
	config = function()
		--[[
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(ev)
				local lang = vim.treesitter.language.get_lang(ev.match)
				if lang and pcall(vim.treesitter.language.add, lang) then
					vim.treesitter.start(ev.buf, lang)
				end
			end,
		})
		]]--
		vim.api.nvim_create_autocmd('FileType', {
		  callback = function(ev)
			if vim.bo[ev.buf].buftype ~= '' then return end   -- skip terminal/prompt/nofile
			local lang = vim.treesitter.language.get_lang(ev.match)
			if not lang then return end
			local ok, added = pcall(vim.treesitter.language.add, lang)
			if not ok or not added then return end
			pcall(vim.treesitter.start, ev.buf, lang)
		  end,
		})
	--[[
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
					init_selection = "<c>.",
					node_decremental = "<c>,",
					node_incremental = "<c>.",
					scope_incremental = false,
				},
			},
		})
		]]--
	end,
}

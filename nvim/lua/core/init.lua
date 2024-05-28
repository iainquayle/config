require("core.options")
require("core.keymaps")

vim.filetype.add({
	extension = {
		templ = "templ",
	},
})

--make a func for this and add css and js
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead',}, {
	pattern = {'*.html.eex'},
	callback = function()
		local buffer = vim.api.nvim_get_current_buf()
		vim.api.nvim_buf_set_option(buffer, 'filetype', "html.eelixir")
	end,
	group = generalSettingsGroup,
})
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead',}, {
	pattern = {'*.js.eex'},
	callback = function()
		local buffer = vim.api.nvim_get_current_buf()
		vim.api.nvim_buf_set_option(buffer, 'filetype', "javascript.eelixir")
	end,
	group = generalSettingsGroup,
})
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead',}, {
	pattern = {'*.css.eex'},
	callback = function()
		local buffer = vim.api.nvim_get_current_buf()
		vim.api.nvim_buf_set_option(buffer, 'filetype', "css.eelixir")
	end,
	group = generalSettingsGroup,
})

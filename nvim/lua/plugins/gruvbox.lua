return {

	--"ellisonleao/gruvbox.nvim",
	"sainnhe/gruvbox-material",
	config = function ()
		vim.g.gruvbox_material_palette = 'material'
		vim.g.gruvbox_material_background = 'soft'
		vim.g.gruvbox_material_transparent_background = 1
		vim.cmd.colorscheme('gruvbox-material')

		--require("gruvbox").setup({ constrast = "soft", transparent_mode = true, })
		--vim.o.background = "dark"
		--vim.cmd([[colorscheme gruvbox]])

		vim.opt.termguicolors = true
	end,
}

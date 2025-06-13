return {
	'nvim-tree/nvim-tree.lua',
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		vim.g.termguicolors = true

		require("nvim-tree").setup({
			sort = {
				sorter = "name",
			},
			view = {
				width = 25,
			},
			renderer = {
				indent_width = 1,
				group_empty = true,
			},
			filters = {
				dotfiles = false,
				git_ignored = false,
			},
		})
		vim.cmd("NvimTreeOpen")
	end,
}

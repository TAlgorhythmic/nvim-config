return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"SmiteshP/nvim-navbuddy",
			dependencies = {
				"SmiteshP/nvim-navic",
				"MunifTanjim/nui.nvim"
			},
			opts = { lsp = { auto_attach = true } }
		}
	},
	config = function()
		local lspconfig = require("lspconfig")
		lspconfig.slint_lsp.setup{}
		lspconfig.phpactor.setup({
			init_options = {
				["language_server_phpstan.enabled"] = true,
				["language_server_psalm.enabled"] = false,
			},
		})
	end,
}

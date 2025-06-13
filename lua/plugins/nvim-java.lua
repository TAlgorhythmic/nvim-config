return {
	"mfussenegger/nvim-jdtls",
	config = function()
		local config = {
			cmd = {'$HOME/.local/share/nvim/mason/bin/jdtls'},
			root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw', 'pom.xml'}, { upward = true })[1]),
		}
		require("jdtls").start_or_attach(config)
		require("lspconfig").jdtls.setup({})
	end,
}

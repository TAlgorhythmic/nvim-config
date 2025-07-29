return {
	"mfussenegger/nvim-jdtls",
	config = function()
		local dir = vim.fs.dirname(vim.fs.find({'gradlew', 'mvnw', 'pom.xml'}, { upward = false })[1])
		if dir == nil then
			return
		end
		local config = {
			cmd = {os.getenv("HOME") .. "/.local/share/nvim/mason/bin/jdtls"},
			root_dir = dir,
		}
		require("jdtls").start_or_attach(config)
		require("lspconfig").jdtls.setup({})
	end,
}

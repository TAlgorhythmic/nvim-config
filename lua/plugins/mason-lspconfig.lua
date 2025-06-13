local servers = {"jdtls", "angularls", "astro", "bashls", "clangd", "cssls", "dockerls", "eslint", "gopls", "groovyls", "html", "htmx", "jsonls", "kotlin_language_server", "lua_ls", "mesonlsp", "neocmake", "phpactor", "pylyzer", "rust_analyzer", "sqls", "ts_ls", "vuels", "yamlls", "zls", "hyprls"}

return {
   "williamboman/mason-lspconfig.nvim",
   config = function()
      require("mason-lspconfig").setup({
         ensure_installed = servers,
      })

      local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
      if not lspconfig_status_ok then
         return
      end

      local opts = {}

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      for _, server in pairs(servers) do
         opts = {}

         server = vim.split(server, "@")[1]

         local require_ok, conf_opts = pcall(require, "lsp.settings." .. server)
         if require_ok then
            opts = vim.tbl_deep_extend("force", conf_opts, opts)
         end

         lspconfig[server].setup({
			capabilities = capabilities,
			settings = opts
		})
      end
   end,
}

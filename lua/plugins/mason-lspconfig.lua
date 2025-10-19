local servers = {"jdtls", "angularls", "astro", "bashls", "clangd", "cssls", "dockerls", "eslint", "gopls", "groovyls", "html", "htmx", "jsonls", "lua_ls", "mesonlsp", "neocmake", "phpactor", "pylyzer", "rust_analyzer", "sqls", "ts_ls", "vuels", "yamlls", "zls", "hyprls", "slint_lsp"}

return {
    "williamboman/mason-lspconfig.nvim",
	dependencies = { "neovim/nvim-lspconfig" },
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = servers,
            automatic_installation = false
        })

        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        for _, server in pairs(servers) do
            -- Load server-specific settings if they exist
            local opts = {}
            local require_ok, conf_opts = pcall(require, "lsp.settings." .. server)
            if require_ok then
                opts = conf_opts
            end

            -- Define the server in the new API
            if not vim.lsp.config[server] then
                vim.lsp.config[server] = {
                    default_config = {
                        capabilities = capabilities,
                        settings = opts,
                        -- filetypes, root_dir, etc., can go here
                    }
                }
            end
        end
    end,
}

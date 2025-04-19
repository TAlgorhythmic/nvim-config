return {
   "hrsh7th/nvim-cmp",
   dependencies = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'petertriho/cmp-git',
   },
   config = function()
      local cmp = require('cmp')

      cmp.setup({
         enabled = function()
            local syn_id = vim.fn.synIDattr(vim.fn.synID(vim.fn.line('.'), vim.fn.col('.'), 1), "name")

            if syn_id:match('String') or syn_id:match('Number') then
               return false
            end
            return true
         end,
         snippet = {
            expand = function(args)
               vim.snippet.expand(args.body)
            end,
         },
         mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<Esc>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
         }),
         sources = cmp.config.sources({
            { name = 'nvim_lsp' },
         },
         {
            { name = 'buffer' },
         })
      })

      -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
         sources = cmp.config.sources({
            { name = 'git' },
         },
         {
            { name = 'buffer' },
         })
      })
      require("cmp_git").setup()

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
         mapping = cmp.mapping.preset.cmdline(),
         sources = {
            { name = 'buffer' }
         }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
         mapping = cmp.mapping.preset.cmdline(),
         sources = cmp.config.sources({
            { name = 'path' }
         }, {
               { name = 'cmdline' }
            }),
         matching = { disallow_symbol_nonprefix_matching = false }
      })
    end
}

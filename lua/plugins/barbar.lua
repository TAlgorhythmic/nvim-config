return {
   'romgrk/barbar.nvim',
   dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
		'nvim-tree/nvim-web-devicons'
   },
   init = function() vim.g.barbar_auto_setup = false end,
   opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      animation = false,
      insert_at_start = true,
   },
}

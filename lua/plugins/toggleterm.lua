return {
   'akinsho/toggleterm.nvim',
   version = "*",
   config = function()
      require("toggleterm").setup({
         hide_numbers = true,
         shade_filetypes = {},
         shade_terminals = true,
         start_in_insert = true,
         insert_mappings = true,
         persist_size = true,
      })
   end,
}


return {
   "mfussenegger/nvim-jdtls",
   config = function()
      require("lspconfig").jdtls.setup({
         settings = {
            java = {
               configuration = {
                  runtimes = {
                     {
                        name = "JavaSE-17",
                        path = "/lib/jvm/java-17-openjdk",
                        default = true,
                     },
                  }
               }
            }
         }
      })
   end,
}

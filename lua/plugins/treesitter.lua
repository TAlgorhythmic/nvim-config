return {
   "nvim-treesitter/nvim-treesitter",
   build = ":TSUpdate",
   config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
         ensure_installed = { "c", "lua", "javascript", "html", "css", "angular", "astro", "bash", "cmake", "cpp", "csv", "cuda", "dockerfile", "groovy", "http", "java", "javascript", "json", "json5", "jsonnet", "kotlin", "llvm", "make", "markdown", "meson", "ninja", "powershell", "printf", "python", "ruby", "rust", "scala", "sql", "typescript", "vue", "yaml", "zig" },
         highlight = { enable = true, additional_vim_regex_highlighting = false },
         indent = { enable = true },
      })
   end,
}


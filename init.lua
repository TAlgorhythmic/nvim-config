vim.cmd("set allowrevins")
vim.cmd("set cursorline")
vim.cmd("set autowrite")
vim.cmd("set autowriteall")
vim.cmd("set bex=.bak")
vim.cmd("set belloff=\"error,esc,hangul,lang\"")
vim.cmd("set breakindent")
vim.cmd("set bufhidden=\"hide\"")
vim.cmd("set casemap=\"internal\"")
vim.cmd("set cdpath=\"/home/inti/projects\"")
vim.cmd("set cin")
vim.cmd("set complete=\".,w,b,u,,U,i,d,t\"")
vim.cmd("set confirm")
vim.cmd("set noexpandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")

vim.g.mapleader = " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local colorspath = vim.fn.stdpath("data") .. "/colors"
vim.opt.rtp:prepend(lazypath)
vim.opt.rtp:prepend(colorspath)
-- require("algorhythmics")
require("lazy").setup({
   spec = {
      { import = "plugins"},
   },
   checker = { enabled = true }
})

require("modus-themes").setup({
   variant = "tritanopia",
   transparent = false,
   dim_inactive = false,
   hide_inactive_statusline = false,
   styles = {
      comments = { italic = false },
      functions = { fg = "#CFFFF7", italic = false },
      keywords = { bold = true, italic = false },
   },
   on_colors = function() end,
	on_highlights = function() end,
})

vim.cmd("colorscheme modus_vivendi")

vim.api.nvim_set_hl(0, "Number", { fg = "#33CCFF", bold = true })
vim.api.nvim_set_hl(0, "Constant", { fg = "#77A7FF" })
vim.api.nvim_set_hl(0, "String", { fg = "#E1D900" })

vim.cmd("hi link @keyword.function Keyword")
vim.cmd("hi link htmlTagName Type");
vim.cmd("hi link typescriptVariableDeclaration Identifier")
vim.cmd("hi link typescriptIdentifierName Constant")
vim.cmd("hi link typescriptVariable Keyword")
vim.cmd("hi link typescriptArrayMethod Function")
vim.cmd("hi link @lsp.type.variable Identifier")
vim.cmd("hi link tsxAttrib Variable")
vim.cmd("hi link typescriptDefault Keyword")
vim.cmd("hi link @lsp.type.modifier.java Keyword")
vim.cmd("hi link @keyword.type.java Keyword")
vim.cmd("hi link @type.builtin.java Keyword")

local terminals = {}

function G_toggle_terminal()
   local termi = require("toggleterm.terminal").Terminal
   local term = termi:new({ cmd = "zsh", hidden = true })
   table.insert(terminals, term)

   term:toggle()
end

function G_toggle_all_terminals()
    for _, term in ipairs(terminals) do
        term:toggle()
    end
end

local map = vim.api.nvim_set_keymap
local optss = { noremap = true, silent = true }


-- Mappings
map('n', '<A-Left>', '<Cmd>BufferPrevious<CR>', optss)
map('n', '<A-Right>', '<Cmd>BufferNext<CR>', optss)

map('n', '<leader><Left>', '<Cmd>BufferMovePrevious<CR>', optss)
map('n', '<leader><Right>', '<Cmd>BufferMoveNext<CR>', optss)
map('n', '<leader>p' ,'<Cmd>BufferPin<CR>', optss)
map("n", "<C-c>", "<Cmd>BufferClose<CR>", optss)
map('n', '<C-z>', 'u', optss)
map('n', '<C-y>', '<C-r>', optss)
map('i', '<C-z>', '<C-o>u', optss)
map('i', '<C-y>', '<C-o><C-r>', optss)
map('t', '<C-t>', [[<C-\><C-n><cmd>lua G_toggle_terminal()<CR>]], optss)
map('n', '<C-t>', '<cmd>lua G_toggle_terminal()<CR>', optss)
map("n", '<C-o>', '<cmd>lua G_toggle_all_terminals()<CR>', optss)
map("t", '<C-o>', [[<C-\><C-n><cmd>lua G_toggle_all_terminals()<CR>]], optss)
map('t', "<C-Up>", [[<C-\><C-n><C-w>k]], optss)
map('t', '<C-Left>', [[<C-\><C-n><C-w>h]], optss)
map('t', '<C-Right>', [[<C-\><C-n><C-w>l]], optss)
map('n', "<C-Up>", [[<C-\><C-n><C-w>k]], optss)
map('n', '<C-Left>', [[<C-\><C-n><C-w>h]], optss)
map('n', '<C-Right>', [[<C-\><C-n><C-w>l]], optss)
map('n', '<C-Down>', [[<C-\><C-n><C-w>j]], optss)
map("n", "<leader>1", "<cmd>lua vim.lsp.buf.definition()<CR>", optss)
map("n", "<leader>2", '<cmd>lua vim.lsp.buf.code_action()<CR>', optss)
map("n", "<leader>3", "<cmd>lua vim.lsp.buf.hover()<CR>", optss)
map("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", optss)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", optss)
map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", optss)
map("n", "<leader>li", "<cmd>LspInfo<cr>", optss)
map("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", optss)
map("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", optss)
map("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", optss)
map("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", optss)
map("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", optss)
map("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", optss)
map("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", optss)
map("n", "<A-o>", "<Cmd>lua require('jdtls').organize_imports()<CR>", optss)
map("i", "<A-o>", "<Cmd>lua require('jdtls').organize_imports()<CR>", optss)
map('i', '<Esc>', [[pumvisible() ? "\<C-e>" : "\<Esc>"]], { expr = true, silent = true })
map(
  "i",
  "<CR>",
  [[pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"]],
  { expr = true, silent = true }
)
map('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true, silent = true })
map('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<BS>"]], { expr = true, silent = true })
map('i', '<CR>', [[pumvisible() ? '<Down><CR>' : '<CR>']], { noremap = true, expr = true, silent = true })

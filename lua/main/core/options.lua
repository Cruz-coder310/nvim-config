vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.showmode = false

vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)
vim.opt.textwidth = 77
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
-- vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.o.inccommand = "split"
vim.o.cursorline = true
vim.o.scrolloff = 8
vim.o.confirm = true

vim.opt.shiftwidth = 4 -- Número de espacios para autoindentación (estándar Python PEP 8)
vim.opt.tabstop = 4 -- Número de espacios que representa un tab (estándar Python PEP 8)
vim.opt.expandtab = true -- Convertir tabs en espacios (Python recomienda espacios)
vim.opt.termguicolors = true

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "text", "markdown" },
	callback = function()
		vim.opt_local.dictionary:append(vim.fn.expand("~/AppData/Local/nvim/dict/english.txt"))
	end,
})

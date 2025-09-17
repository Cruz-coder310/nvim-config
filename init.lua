-- Mapea tus atajos de teclado
require("main.core.keymaps")
-- Establece tus opciones principales de Neovim
require("main.core.options")

-- Define la ruta para `lazy.nvim`
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Si `lazy.nvim` no está instalado, clónalo desde su repositorio
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end

-- Agrega la ruta de `lazy.nvim` a la configuración de runtime de Neovim
vim.opt.rtp:prepend(lazypath)

-- Configura y carga tus plugins con `lazy.nvim`
require("lazy").setup({
	-- Carga otras configuraciones de plugins modulares
	require("main.plugins.color_theme"),
	require("main.plugins.telescope"),
	require("main.plugins.mini"),
	require("main.plugins.extra"),
	require("main.plugins.lsp"),
	require("main.plugins.treesitter"),
	require("main.plugins.autocompletado"),
	require("main.plugins.conform"),
	require("main.plugins.which-key"),
	require("main.plugins.autopairs"),
	-- require("main.plugins.lint"),
	-- require("main.plugins.extra.markdown"),
	require("main.plugins.extra.glow"),
}, {
	rocks = {
		enabled = false,
	},
})

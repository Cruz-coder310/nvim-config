return {
	"fenetikm/falcon",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd("colorscheme falcon")
		local transparency_config = { bg = "none" }
		vim.api.nvim_set_hl(0, "Normal", transparency_config)
		vim.api.nvim_set_hl(0, "NormalFloat", transparency_config)
		vim.api.nvim_set_hl(0, "Folded", transparency_config)
		vim.api.nvim_set_hl(0, "SignColumn", transparency_config)
		vim.api.nvim_set_hl(0, "StatusLine", transparency_config)
		vim.api.nvim_set_hl(0, "StatusLineNC", transparency_config)
		vim.api.nvim_set_hl(0, "EndOfBuffer", transparency_config)
		vim.api.nvim_set_hl(0, "VertSplit", transparency_config)
	end,
}

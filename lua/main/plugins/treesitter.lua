return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = {
			"python",
			"lua",
			"vim",
			"markdown",
			"markdown_inline",
			"html",
			"css",
			"javascript",
			"json",
		},
		highlight = { enable = true },
		indent = { enable = true },
	},
}

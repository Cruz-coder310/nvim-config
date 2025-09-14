return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		format_on_save = true,
		formatters_by_ft = {
			python = { "ruff_format" },
			lua = { "stylua" },
		},
	},
}

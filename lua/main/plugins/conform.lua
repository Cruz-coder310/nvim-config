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
		format_on_save = { timeout_ms = 500, lsp_fallback = true },
		formatters_by_ft = {
			python = { "ruff_format" },
			lua = { "stylua" },
			["django-html"] = { "djlint" },
			html = { "djlint" },
			css = { "prettier" },
			javascript = { "prettier" },
			json = { "prettier" },
			markdown = { "prettier" },
		},
	},
}

return -- LSP + Mason
{
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end
				map("grn", vim.lsp.buf.rename, "Rename")
				map("gra", vim.lsp.buf.code_action, "Code Action")
				map("grd", vim.lsp.buf.definition, "Definition")
				map("grr", vim.lsp.buf.references, "References") -- sin telescope
			end,
		})

		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded" },
			virtual_text = true,
		})

		local servers = {
			pyright = {},
			lua_ls = {
				settings = { Lua = { completion = { callSnippet = "Replace" } } },
			},
			html = { filetypes = { "html", "htmldjango" } },
			emmet_ls = { filetypes = { "html", "css", "javascript", "django", "htmldjango" } },
			tailwindcss = {
				filetypes = { "html", "htmldjango", "css", "javascriptreact", "typescriptreact" },
			},
		}

		require("mason-tool-installer").setup({
			ensure_installed = {
				"pyright",
				"black",
				"stylua",
				"html",
				"cssls",
				"typescript-language-server",
				"emmet_ls",
				"tailwindcss",
			},
		})

		require("mason-lspconfig").setup({
			handlers = {
				-- Configuración genérica
				function(server)
					local opts = servers[server] or {}
					require("lspconfig")[server].setup(opts)
				end,

				-- Configuración especial para html-ls
				["html"] = function()
					require("lspconfig").html.setup({
						filetypes = { "html", "htmldjango" },
						init_options = {
							configurationSection = { "html", "css", "javascript" },
							embeddedLanguages = {
								css = true,
								javascript = true,
							},
							provideFormatter = true,
						},
					})
				end,
			},
		})
	end,
}

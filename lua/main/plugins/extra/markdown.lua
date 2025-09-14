return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {
			heading = {
				enabled = true, -- muestra títulos grandes y claros
				sign = true, -- añade símbolos al inicio de los headings
			},
			code = {
				enabled = true, -- resalta bloques de código
			},
			dash = {
				enabled = true, -- estilos de listas con guiones
			},
			quote = {
				enabled = true, -- estilo especial para citas
			},
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- obligatorio para el render
			"nvim-tree/nvim-web-devicons", -- íconos bonitos (opcional)
		},
	},
}

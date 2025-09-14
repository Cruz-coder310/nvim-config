return {
	"ellisonleao/glow.nvim",
	config = function()
		require("glow").setup({
			-- 🎨 ESTILO VISUAL ÉPICO
			style = "auto", -- Tema oscuro bien perrón
			border = "rounded", -- Bordes redondeados aesthetic
			-- width = 79, -- Ancho personalizado
			-- height = 40, -- 90% de la altura de la pantalla
			pager = false, -- Modo pager desactivado (más fluido)

			-- 🎯 COMPORTAMIENTO AVANZADO
			-- width_ratio = 0.98, -- Casi ancho completo
			height_ratio = 0.92, -- 95% de altura para ver la barra de estado
		})
	end,
	cmd = "Glow",
	ft = "markdown",
	-- 🚀 CARGA PERESOSA INTELIGENTE
	event = { "BufReadPre *.md", "BufNewFile *.md" },
}

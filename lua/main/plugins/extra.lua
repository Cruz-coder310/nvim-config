-- Standalone plugins with less than 10 lines of config go here
return {
	-- {
	--   -- Tmux & split window navigation
	--   'christoomey/vim-tmux-navigator',
	-- },
	-- {
	--   -- Detect tabstop and shiftwidth automatically
	--   'tpope/vim-sleuth',
	-- },
	-- {
	--   -- Powerful Git integration for Vim
	--   'tpope/vim-fugitive',
	-- },
	-- {
	--   -- GitHub integration for vim-fugitive
	--   'tpope/vim-rhubarb',
	-- },
	{
		"NMAC427/guess-indent.nvim",
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		-- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		-- High-performance color highlighter
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
}

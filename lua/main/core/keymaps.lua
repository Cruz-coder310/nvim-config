-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Opciones comunes para keymaps
local opts = { noremap = true, silent = true }

-- [[ Basic Keymaps ]]
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Diagnostics
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "[Q]uickfix list (Diagnostics)" })

-- Terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Disable arrow keys
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>', { desc = "Disable ←" })
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>', { desc = "Disable →" })
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>', { desc = "Disable ↑" })
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>', { desc = "Disable ↓" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Window left" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Window right" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Window down" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Window up" })

-- Move windows
vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window left" })
vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window right" })
vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window down" })
vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window up" })

-- Buffers
vim.keymap.set("n", "<leader>bb", "<cmd>ls<cr>:b ", { desc = "[B]uffers list" })
vim.keymap.set("n", "<leader>n", "<cmd>bn<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>ww", "<cmd>w<cr>", { desc = "[W]rite file" })
vim.keymap.set("n", "<leader>xx", "<cmd>bdelete<cr>", { desc = "Close buffer" })

-- Move lines/blocks
vim.keymap.set("n", "<A-j>", ":m .+1<cr>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<cr>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move block down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move block up" })

-- Resize splits
vim.keymap.set("n", "<Up>", ":resize -2<CR>", { desc = "Resize split up" })
vim.keymap.set("n", "<Down>", ":resize +2<CR>", { desc = "Resize split down" })
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", { desc = "Resize split left" })
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", { desc = "Resize split right" })

-- Search enhancements
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Splits
vim.keymap.set("n", "<leader>v", "<C-w>v", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>h", "<C-w>s", { desc = "Split horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Split equal size" })
vim.keymap.set("n", "<leader>xs", ":close<CR>", { desc = "Close split" })

-- Indent
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
vim.keymap.set("v", "P", '"_dP', { desc = "Paste without yanking" })

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "[T]ab [O]pen new" })
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "[T]ab close" })
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "[T]ab next" })
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "[T]ab prev" })

-- [[ Autocommands ]]
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Fecha y hora
vim.keymap.set("n", "<F5>", function()
	os.setlocale("en_US") -- English locale
	local date = os.date("%A, %d %B %Y — %H:%M:%S")
	vim.api.nvim_put({ "📅 " .. date }, "l", true, true)
end, { desc = "Insert date/time in English" })

-- Spell check en notas
vim.keymap.set("n", "<F4>", function()
	vim.opt.spell = not vim.opt.spell:get()
	vim.opt.spelllang = "en"
	if vim.opt.spell:get() then
		print("Spell check ON (English)")
	else
		print("Spell check OFF")
	end
end, { desc = "Toggle spell check with F4" })

vim.keymap.set("n", "<leader>g", "<cmd>Glow<CR>", { desc = "Preview Markdown with Glow" })
-- vim.keymap.set("n", "<leader>m", "<cmd>RenderMarkdown toggle<CR>", { desc = "Toggle Markdown render" })

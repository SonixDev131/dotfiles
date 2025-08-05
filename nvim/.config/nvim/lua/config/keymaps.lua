local map = vim.keymap.set
local floating = require("utils.floating")

-- File operations
map('n', '<leader>o', ':update<CR> :source<CR>')
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>q', ':quit<CR>')

-- Clipboard operations
map({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')
map({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>')

-- Plugin shortcuts
map('n', '<leader>f', ":Pick files<CR>")
map('n', '<leader>h', ":Pick help<CR>")
map('n', '<leader>e', ":Oil<CR>")
map('n', '<leader>lf', vim.lsp.buf.format)
map('n', '<leader>x', '<Cmd>:.lua<CR>')

-- Window navigation (prioritize tmux navigation when available)
-- Use Alt+hjkl for pure vim window navigation to avoid conflicts
map("n", "<A-h>", "<C-w>h", { desc = "Go to Left Window" })
map("n", "<A-j>", "<C-w>j", { desc = "Go to Lower Window" })
map("n", "<A-k>", "<C-w>k", { desc = "Go to Upper Window" })
map("n", "<A-l>", "<C-w>l", { desc = "Go to Right Window" })

-- Tmux navigation (uses Ctrl+hjkl)
map("n", "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", { desc = "Navigate left (tmux)" })
map("n", "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>", { desc = "Navigate down (tmux)" })
map("n", "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>", { desc = "Navigate up (tmux)" })
map("n", "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>", { desc = "Navigate right (tmux)" })
map("n", "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", { desc = "Navigate to previous (tmux)" })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines (using Shift+Alt to avoid conflicts)
map("n", "<S-A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<S-A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<S-A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<S-A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<S-A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<S-A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- Clear search and stop snippet on escape
map({ "i", "n", "s" }, "<esc>", function()
	vim.cmd("noh")
	return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Diagnostic
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "Next Diagnostic" })
map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Prev Diagnostic" })

-- LSP
map("n", "grd", vim.lsp.buf.definition, { desc = "Goto Definition" })

-- Git
map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })

-- Terminal
map("t", "<esc><esc>", "<c-\\><c-n>")
map({ "n", "t" }, "<space>tt", floating.toggle_terminal, { desc = "Toggle floating terminal" })

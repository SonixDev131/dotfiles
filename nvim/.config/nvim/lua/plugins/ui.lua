-- UI Plugins Configuration

-- Oil.nvim (file explorer)
require("oil").setup()

-- Catppuccin Theme
require("catppuccin").setup({
	term_colors = true,
	transparent_background = false,
	color_overrides = {
		mocha = {
			base = "#1a1a1a",
			mantle = "#141414",
			crust = "#242424",
		},
	},
	auto_intergrations = true,
})

-- Apply colorscheme
vim.cmd("colorscheme catppuccin")
vim.cmd(":hi statusline guibg=NONE")
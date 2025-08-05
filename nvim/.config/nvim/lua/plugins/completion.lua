-- Snippets & Completion Configuration

-- Load VSCode-style snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- Blink completion setup
require("blink.cmp").setup({
	signature = { enabled = true },
	completion = {
		documentation = { auto_show = true },
		menu = { auto_show = true }
	},
})
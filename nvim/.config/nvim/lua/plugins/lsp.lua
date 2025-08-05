-- LSP Configuration
local lsp_servers = {
	"lua_ls",
	"vtsls",
	"intelephense",
	"tailwindcss",
	"bashls"
}

-- Mason (LSP installer)
require("mason").setup()
require("mason-lspconfig").setup()
require('mason-tool-installer').setup({
	ensure_installed = lsp_servers,
	auto_update = true,
})

-- Enable LSP servers
vim.lsp.enable(lsp_servers)

-- Lua LSP specific configuration
vim.lsp.config('lua_ls', {
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = {
					'vim',
					'require'
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})
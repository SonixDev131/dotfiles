-- Treesitter (syntax highlighting)
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash", "c", "diff", "html", "javascript", "jsdoc", "json", "jsonc", "lua", "luadoc", "luap", "markdown",
		"markdown_inline", "printf", "python", "query", "regex", "toml", "tsx", "typescript", "vim", "vimdoc", "xml", "yaml",
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-space>",
			node_incremental = "<C-space>",
			scope_incremental = false,
			node_decremental = "<bs>",
		},
	},
	auto_install = { enable = true },
	highlight = {
		enable = true,
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
	}
})

-- Treesitter auto-update handler
vim.api.nvim_create_autocmd('PackChanged', {
	desc = 'Handle nvim-treesitter updates',
	group = vim.api.nvim_create_augroup('nvim-treesitter-pack-changed-update-handler', { clear = true }),
	callback = function(event)
		if event.data.kind == 'update' then
			vim.notify('nvim-treesitter updated, running TSUpdate...', vim.log.levels.INFO)
			---@diagnostic disable-next-line: param-type-mismatch
			local ok = pcall(vim.cmd, 'TSUpdate')
			if ok then
				vim.notify('TSUpdate completed successfully!', vim.log.levels.INFO)
			else
				vim.notify('TSUpdate command not available yet, skipping', vim.log.levels.WARN)
			end
		end
	end,
})
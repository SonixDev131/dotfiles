-- ============================================================================
-- Neovim Configuration Entry Point
-- ============================================================================
-- This file loads all configuration modules in the correct order

-- Load core configuration
require("config.options")
require("config.keymaps")

-- Load and configure plugins
require("plugins.init")      -- Plugin management (must be first)
require("plugins.lsp")       -- LSP configuration
require("plugins.treesitter") -- Syntax highlighting
require("plugins.completion") -- Completion and snippets
require("plugins.picker")    -- Fuzzy finder
require("plugins.ui")        -- UI plugins (theme, file explorer)
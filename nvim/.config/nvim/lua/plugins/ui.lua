return {
  {
    "catppuccin/nvim",
    priority = 1000, -- Ensure it loads first
    opts = {
      term_colors = true,
      transparent_background = true,
      -- color_overrides = {
      --   mocha = {
      --     base = "#1a1a1a",
      --     mantle = "#141414",
      --     crust = "#242424",
      --   },
      -- },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
  -- Noice UI enhancements
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      routes = {
        {
          filter = { event = "notify", find = "No information available" },
          opts = { skip = true },
        },
      },
    },
  },
  -- Disable some UI plugins for performance/minimalism
  { "nvim-lualine/lualine.nvim", enabled = false },
  { "akinsho/bufferline.nvim",   enabled = false },
}

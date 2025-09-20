return {
  {
    "catppuccin/nvim",
    priority = 1000, -- Ensure it loads first
    opts = {
      term_colors = true,
      transparent_background = true,
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
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
        {
          view = "notify",
          filter = { event = "msg_showmode" },
        },
      },
    },
  },
  -- Disable some UI plugins for performance/minimalism
  { "nvim-lualine/lualine.nvim", enabled = false },
  { "akinsho/bufferline.nvim",   enabled = false },
  { "folke/snacks.nvim",         opts = { dashboard = { enabled = false } } }
}

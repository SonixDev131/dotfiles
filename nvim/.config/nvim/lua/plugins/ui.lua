return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
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
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}

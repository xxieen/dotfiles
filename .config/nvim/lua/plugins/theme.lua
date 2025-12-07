return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      -- style = "storm", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_colors = function(colors)
        colors.border = "#565f89"
      end,
    },
  },

  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "gruvbox",
  --   },
  -- },
}

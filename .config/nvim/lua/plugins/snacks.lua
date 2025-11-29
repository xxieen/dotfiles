return {
  {
    "snacks.nvim",

    keys = {
      { "<leader>fe", false },
      { "<leader>fE", false },
      { "<leader>E", false },
      { "<leader>e", false },
    },

    opts = {
      scroll = { enabled = false },
      explorer = { enabled = false },
      statuscolumn = {
        enabled = true,
        left = { "mark", "sign" }, -- priority of signs on the left (high to low)
        right = { "fold", "git" }, -- priority of signs on the right (high to low)
        folds = {
          open = true, -- show open fold icons
          git_hl = true, -- use Git Signs hl for fold icons
        },
        git = {
          -- patterns to match Git signs
          patterns = { "GitSign", "MiniDiffSign" },
        },
        refresh = 50, -- refresh at most every 50ms
      },

      dashboard = {
        formats = {
          key = function(item)
            return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
          end,
        },
        sections = {
          { section = "terminal", cmd = "fortune -s | cowsay", hl = "header", padding = 1, indent = 8 },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },

      -- picer = {
      --   sources = {
      --     explorer = {
      --       layout = {
      --         preset = "right",
      --         auto_hide = { "input" },
      --       },
      --     },
      --   },
      -- },

      indent = {
        chun = {
          enabled = true,
          char = { corner_top = "╭", corner_bottom = "╰" },
        },
      },
    },
  },
}

return {
  "saghen/blink.cmp",
  dependencies = {
    -- { "marcoSven/blink-cmp-yanky" },
    { "xzbdmw/colorful-menu.nvim", opts = {} },
  },
  opts = {
    completion = {
      documentation = { window = { border = "rounded" } },
      menu = {
        border = "rounded",
        draw = {
          columns = { { "kind_icon" }, { "label", "kind", gap = 1 } },
          components = {
            label = {
              text = function(ctx)
                return require("colorful-menu").blink_components_text(ctx)
              end,
              highlight = function(ctx)
                return require("colorful-menu").blink_components_highlight(ctx)
              end,
            },
            kind_icon = {
              text = function(ctx)
                if ctx.kind == "Yank" then
                  return ctx.kind_icon .. ctx.icon_gap
                end
                local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                return kind_icon
              end,
              -- (optional) use highlights from mini.icons
              highlight = function(ctx)
                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                return hl
              end,
            },
            kind = {
              text = function(ctx)
                return ctx.kind
              end,
              -- (optional) use highlights from mini.icons
              highlight = function(ctx)
                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                return hl
              end,
            },
          },
        },
      },

      list = {
        selection = {
          preselect = false,
          auto_insert = true,
        },
      },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    signature = { window = { border = "rounded" } },
    keymap = {
      preset = "default",

      ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
      ["<CR>"] = { "select_and_accept", "fallback" },
      ["<C-y>"] = { "select_and_accept", "fallback" },
    },
    -- sources = {
    --   default = { "lsp", "path", "buffer", "snippets", "yank" },
    --
    --   providers = {
    --     yank = {
    --       name = "yank",
    --       module = "blink-yanky",
    --       opts = {
    --         minLength = 5,
    --         onlyCurrentFiletype = true,
    --         -- trigger_characters = { '"' },
    --         kind_icon = "󰅍",
    --       },
    --     },
    --   },
    -- },
  },
}

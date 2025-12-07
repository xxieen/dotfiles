return {
  "saghen/blink.cmp",
  build = "cargo build --release",
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
                if ctx.kind == "Copilot" then
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
    fuzzy = { implementation = "prefer_rust" },
    signature = { window = { border = "rounded" } },
    keymap = {
      preset = "super-tab",
      ["<CR>"] = { "accept", "fallback" },
    },
  },
}

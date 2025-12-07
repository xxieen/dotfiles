return {
  "folke/trouble.nvim",
  keys = {
    {
      "<leader>xx",
      function()
        require("trouble").toggle("preview_float")
      end,
      desc = "Diagnostics (with Preview)",
    },
  },
  opts = {
    focus = true,
    auto_preview = true,
    follow = true,
    auto_open = false, -- 有诊断就直接打开
    auto_close = false, -- 错误全消失时自动关闭
    modes = {
      preview_float = {
        mode = "diagnostics",
        preview = {
          type = "float",
          relative = "editor",
          border = "rounded",
          title = "Preview",
          title_pos = "center",
          position = { 0, -2 },
          size = { width = 0.3, height = 0.3 },
          zindex = 200,
        },
      },
    },
  },
}

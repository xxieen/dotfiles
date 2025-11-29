return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    if opts.sections and opts.sections.lualine_z then
      -- 基于原配置覆盖第一个组件(时间)
      opts.sections.lualine_z[1] = {
        function()
          return " " .. os.date("%R")
        end,
        color = function()
          if vim.bo.modified then
            -- 未保存：紫色背景与白字高亮
            return { fg = "#ffffff", bg = "#7c3aed", gui = "bold" }
          end
          -- 已保存：恢复主题默认
          return nil
        end,
        padding = { left = 1, right = 1 },
      }
    end
    return opts
  end,
}

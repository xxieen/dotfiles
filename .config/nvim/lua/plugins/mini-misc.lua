-- 同步终端与neovim的颜色
return {
  "nvim-mini/mini.misc",
  version = false,
  config = function()
    require("mini.misc").setup_termbg_sync()
  end,
}

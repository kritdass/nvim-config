-- [nfnl] fnl/plugins/theme.fnl
local function _1_()
  return require("matugen").setup()
end
return {"RRethy/base16-nvim", priority = 1000, config = _1_, lazy = false}

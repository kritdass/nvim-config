-- [nfnl] fnl/plugins/flash.fnl
local function _1_()
  local flash = require("flash")
  return {{"s", flash.jump, mode = {"n", "o", "x"}, desc = "Flash"}, {"S", flash.treesitter, mode = {"n", "o", "x"}, desc = "Flash Treesitter"}, {"<C-e>", flash.toggle, mode = {"c"}, desc = "Toggle Flash search"}}
end
return {"folke/flash.nvim", event = "VeryLazy", opts = {}, keys = _1_}

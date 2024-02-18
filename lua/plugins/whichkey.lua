-- :fennel:1707436565
local function _1_(_, opts)
  local wk = require("which-key")
  wk.setup(opts)
  return wk.register(opts.defaults)
end
return {"folke/which-key.nvim", event = "VeryLazy", opts = {defaults = {["<leader>t"] = {name = "+terminal"}, ["<leader>x"] = {name = "+trouble"}, ["<leader>h"] = {name = "+git"}, ["<leader>b"] = {name = "+buffer"}, ["<leader>f"] = {name = "+find"}, ["<leader>q"] = {name = "+quit"}, ["<leader>u"] = {name = "+toggle"}, ["<leader><tab>"] = {name = "+tab"}, ["<leader>w"] = {name = "+window"}, ["<leader>c"] = {name = "+lsp"}, z = {name = "+fold"}, g = {name = "+goto"}, ["]"] = {name = "+next"}, ["["] = {name = "+prev"}}}, config = _1_}
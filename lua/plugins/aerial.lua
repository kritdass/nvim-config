-- :fennel:1704135981
local function _1_(buffer)
  local map
  local function _2_(mode, lhs, rhs, desc)
    return vim.keymap.set(mode, lhs, rhs, {buffer = buffer, desc = desc})
  end
  map = _2_
  map("n", "}", "<cmd>AerialNext<cr>", "Aerial next")
  return map("n", "{", "<cmd>AerialPrev<cr>", "Aerial prev")
end
return {"stevearc/aerial.nvim", opts = {on_attach = _1_}, cmd = "AerialToggle"}
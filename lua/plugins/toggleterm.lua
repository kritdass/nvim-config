-- :fennel:1707436289
local function _1_()
  local terminal = require("toggleterm.terminal").Terminal
  local lazygit = terminal:new({cmd = "lazygit", close_on_exit = true, direction = "tab", dir = "git_dir", name = "lazygit"})
  local function _2_()
    return lazygit:toggle()
  end
  return vim.api.nvim_create_user_command("Lazygit", _2_, {force = true})
end
return {"akinsho/toggleterm.nvim", cmd = {"ToggleTerm", "ToggleTermToggleAll"}, keys = _1_, opts = {shade_terminals = false}}
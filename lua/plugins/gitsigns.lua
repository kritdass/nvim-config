-- :fennel:1704135981
local function _1_(buffer)
  local gs = package.loaded.gitsigns
  local map
  local function _2_(mode, lhs, rhs, desc)
    return vim.keymap.set(mode, lhs, rhs, {buffer = buffer, desc = desc})
  end
  map = _2_
  local wk = require("which-key")
  map("n", "<leader>hg", "<cmd>Lazygit<cr>", "Lazygit")
  map("n", "]h", gs.next_hunk, "Next hunk")
  map("n", "[h", gs.next_hunk, "Prev hunk")
  map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
  map("n", "<leader>hu", gs.stage_hunk, "Unstage hunk")
  map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
  map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
  map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")
  map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
  local function _3_()
    return gs.blame_line({full = true})
  end
  map("n", "<leader>hb", _3_, "Blame line")
  map("n", "<leader>hd", gs.diffthis, "Diff this")
  local function _4_()
    return gs.diffthis("~")
  end
  map("n", "<leader>hD", _4_, "Diff this ~")
  return wk.register({h = {name = "git"}}, {prefix = "<leader>"})
end
return {"lewis6991/gitsigns.nvim", event = {"BufReadPre", "BufNewFile"}, opts = {on_attach = _1_}}
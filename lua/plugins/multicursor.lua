-- [nfnl] fnl/plugins/multicursor.fnl
local function _1_()
  local mc = require("multicursor-nvim")
  mc.setup()
  local function _2_()
    return mc.matchAddCursor(1)
  end
  _G.vim.keymap.set({"n", "x"}, "<localleader>n", _2_, {desc = "Add cursor after"})
  local function _3_()
    return mc.matchSkipCursor(1)
  end
  _G.vim.keymap.set({"n", "x"}, "<localleader>s", _3_, {desc = "Skip cursor after"})
  local function _4_()
    return mc.matchAddCursor(-1)
  end
  _G.vim.keymap.set({"n", "x"}, "<localleader>N", _4_, {desc = "Add cursor before"})
  local function _5_()
    return mc.matchSkipCursor(-1)
  end
  _G.vim.keymap.set({"n", "x"}, "<localleader>S", _5_, {desc = "Skip cursor before"})
  _G.vim.keymap.set({"n", "x"}, "<localleader>q", mc.toggleCursor, {desc = "Toggle cursors"})
  local function _6_(layer_set)
    layer_set({"n", "x"}, "<localleader>x", mc.deleteCursor, {desc = "Delete cursor"})
    local function _7_()
      if not mc.cursorsEnabled() then
        return mc.enableCursors()
      else
        return mc.clearCursors()
      end
    end
    return layer_set("n", "<esc>", _7_)
  end
  return mc.addKeymapLayer(_6_)
end
return {"jake-stewart/multicursor.nvim", branch = "1.0", event = {"BufReadPre", "BufNewFile", "VeryLazy"}, config = _1_}

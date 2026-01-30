-- [nfnl] fnl/config/keymaps.fnl
_G.vim.keymap.set({"n", "i", "x", "s"}, "<C-s>", "<cmd>:silent w<cr><esc>", {desc = "Save file", silent = true})
_G.vim.keymap.set({"n"}, "<leader>s", "<cmd>:silent w<cr><esc>", {desc = "Save file", silent = true})
_G.vim.keymap.set({"n"}, "<leader>l", "<cmd>Lazy<cr>", {desc = "Lazy"})
_G.vim.keymap.set({"n"}, "<leader>m", "<cmd>Mason<cr>", {desc = "Mason"})
local function _1_()
  return _G.Snacks.lazygit()
end
_G.vim.keymap.set({"n", "t"}, "<leader>g", _1_, {desc = "Lazygit"})
_G.vim.keymap.set({"n"}, "<leader>T", "<cmd>Typr<cr>", {desc = "Typr"})
local function _2_()
  return _G.Snacks.terminal(nil, {win = {position = "bottom", height = 0.3}})
end
_G.vim.keymap.set({"n"}, "<leader>th", _2_, {desc = "Horizontal terminal"})
local function _3_()
  return _G.Snacks.terminal(nil, {win = {position = "right", width = 0.4}})
end
_G.vim.keymap.set({"n"}, "<leader>tv", _3_, {desc = "Vertical terminal"})
local function _4_()
  return _G.Snacks.terminal(nil, {win = {position = "bottom", height = 0.3}})
end
_G.vim.keymap.set({"n"}, "<leader>t-", _4_, {desc = "Horizontal terminal"})
local function _5_()
  return _G.Snacks.terminal(nil, {win = {position = "right", width = 0.4}})
end
_G.vim.keymap.set({"n"}, "<leader>t\\", _5_, {desc = "Vertical terminal"})
local function _6_()
  return _G.Snacks.terminal(nil, {win = {position = "float"}})
end
_G.vim.keymap.set({"n"}, "<leader>tf", _6_, {desc = "Floating terminal"})
_G.vim.keymap.set({"t"}, "<esc>", "<C-\\><C-n>", {desc = "Enter normal mode"})
local function _7_()
  return _G.Snacks.terminal.toggle()
end
_G.vim.keymap.set({"n", "i", "x", "s", "t"}, "<C-\\>", _7_, {desc = "Toggle terminal"})
_G.vim.keymap.set({"n"}, "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", {desc = "Trouble"})
_G.vim.keymap.set({"n"}, "<leader>xq", "<cmd>Trouble qflist toggle<cr>", {desc = "Quickfix"})
_G.vim.keymap.set({"n"}, "<leader>xl", "<cmd>Trouble loclist toggle<cr>", {desc = "Location list"})
local function _8_()
  return _G.Snacks.explorer()
end
_G.vim.keymap.set({"n"}, "<leader>e", _8_, {desc = "Explorer"})
local function _9_()
  return _G.Snacks.picker.files()
end
_G.vim.keymap.set({"n"}, "<leader>ff", _9_, {desc = "Find files"})
local function _10_()
  return _G.Snacks.picker.files[{cwd = "$HOME/.config/nvim"}]()
end
_G.vim.keymap.set({"n"}, "<leader>fc", _10_, {desc = "Config files"})
local function _11_()
  return _G.Snacks.picker.colorschemes()
end
_G.vim.keymap.set({"n"}, "<leader>fs", _11_, {desc = "Find colorscheme"})
local function _12_()
  return _G.Snacks.picker.recent()
end
_G.vim.keymap.set({"n"}, "<leader>fr", _12_, {desc = "Recent files"})
local function _13_()
  return _G.Snacks.picker.todo_comments()
end
_G.vim.keymap.set({"n"}, "<leader>fu", _13_, {desc = "Todos"})
local function _14_()
  return _G.Snacks.picker.grep()
end
_G.vim.keymap.set({"n"}, "<leader>ft", _14_, {desc = "Grep"})
local function _15_()
  return _G.Snacks.picker.man()
end
_G.vim.keymap.set({"n"}, "<leader>fm", _15_, {desc = "Find man pages"})
local function _16_()
  return _G.Snacks.picker.keymaps()
end
_G.vim.keymap.set({"n"}, "<leader>fk", _16_, {desc = "Find keymaps"})
local function _17_()
  return _G.Snacks.picker.lines()
end
_G.vim.keymap.set({"n"}, "<leader>fb", _17_, {desc = "Search buffer lines"})
local function _18_()
  return _G.Snacks.picker.git_log()
end
_G.vim.keymap.set({"n"}, "<leader>fg", _18_, {desc = "Search Git commits"})
local function _19_()
  return _G.Snacks.picker.lsp_symbols()
end
_G.vim.keymap.set({"n"}, "<leader>fa", _19_, {desc = "Search symbols"})
local function _20_()
  return _G.Snacks.picker.help()
end
_G.vim.keymap.set({"n"}, "<leader>fh", _20_, {desc = "Search help tags"})
_G.vim.keymap.set({"n"}, "<leader>ww", "<C-w>w", {desc = "Other window"})
_G.vim.keymap.set({"n"}, "<leader>wd", "<C-w>c", {desc = "Delete window"})
_G.vim.keymap.set({"n"}, "<leader>wh", "<C-w>s", {desc = "Split window horizontally"})
_G.vim.keymap.set({"n"}, "<leader>wv", "<C-w>v", {desc = "Split window vertically"})
_G.vim.keymap.set({"n"}, "<leader>w-", "<C-w>s", {desc = "Split window horizontally"})
_G.vim.keymap.set({"n"}, "<leader>w\\", "<C-w>v", {desc = "Split window vertically"})
_G.vim.keymap.set({"n"}, "[b", "<cmd>bprevious<cr>", {desc = "Prev buffer"})
_G.vim.keymap.set({"n"}, "]b", "<cmd>bnext<cr>", {desc = "Next buffer"})
_G.vim.keymap.set({"n"}, "<leader>bp", "<cmd>bprevious<cr>", {desc = "Prev buffer"})
_G.vim.keymap.set({"n"}, "<leader>bn", "<cmd>bnext<cr>", {desc = "Next buffer"})
_G.vim.keymap.set({"n"}, "<leader>bb", "<cmd>e #<cr>", {desc = "Other buffer"})
_G.vim.keymap.set({"n"}, "<leader>bd", "<cmd>bdelete<cr>", {desc = "Delete buffer"})
_G.vim.keymap.set({"n"}, "<leader><tab>l", "<cmd>tablast<cr>", {desc = "Last tab"})
_G.vim.keymap.set({"n"}, "<leader><tab>f", "<cmd>tabfirst<cr>", {desc = "First tab"})
_G.vim.keymap.set({"n"}, "<leader><tab><tab>", "<cmd>tabnew<cr>", {desc = "New tab"})
_G.vim.keymap.set({"n"}, "<leader><tab>d", "<cmd>tabclose<cr>", {desc = "Delete tab"})
_G.vim.keymap.set({"n"}, "<leader><tab>n", "<cmd>tabnext<cr>", {desc = "Next tab"})
_G.vim.keymap.set({"n"}, "<leader><tab>p", "<cmd>tabprevious<cr>", {desc = "Prev tab"})
_G.vim.keymap.set({"n"}, "]<tab>", "<cmd>tabnext<cr>", {desc = "Next tab"})
_G.vim.keymap.set({"n"}, "[<tab>", "<cmd>tabprevious<cr>", {desc = "Prev tab"})
_G.vim.keymap.set({"n"}, "<leader>qq", "<cmd>qa<cr>", {desc = "Quit all"})
_G.vim.keymap.set({"n"}, "<leader>qw", "<C-w>c", {desc = "Quit window"})
_G.vim.keymap.set({"n"}, "<leader>qb", "<cmd>bdelete<cr>", {desc = "Quit buffer"})
_G.vim.keymap.set({"n"}, "<leader>qt", "<cmd>tabclose<cr>", {desc = "Quit tab"})
_G.vim.keymap.set({"n"}, "<leader>q<tab>", "<cmd>tabclose<cr>", {desc = "Quit tab"})
local function _21_()
  return require("todo-comments").jump_next()
end
_G.vim.keymap.set({"n"}, "]t", _21_, {desc = "Next todo"})
local function _22_()
  return require("todo-comments").jump_prev()
end
_G.vim.keymap.set({"n"}, "[t", _22_, {desc = "Next todo"})
do
  local sev
  local function _23_(severity)
    if severity then
      return _G.vim.diagnostic.severity[severity]
    else
      return nil
    end
  end
  sev = _23_
  local next
  local function _25_(severity)
    local function _26_()
      return _G.vim.diagnostic.goto_next({severity = sev(severity)})
    end
    return _26_
  end
  next = _25_
  local prev
  local function _27_(severity)
    local function _28_()
      return _G.vim.diagnostic.goto_prev({severity = sev(severity)})
    end
    return _28_
  end
  prev = _27_
  _G.vim.keymap.set({"n"}, "]d", next(), {desc = "Next diagnostic"})
  _G.vim.keymap.set({"n"}, "[d", prev(), {desc = "Prev diagnostic"})
  _G.vim.keymap.set({"n"}, "]e", next("ERROR"), {desc = "Next error"})
  _G.vim.keymap.set({"n"}, "[e", prev("ERROR"), {desc = "Prev error"})
  _G.vim.keymap.set({"n"}, "]w", next("WARN"), {desc = "Next warning"})
  _G.vim.keymap.set({"n"}, "[w", prev("WARN"), {desc = "Prev warning"})
end
local toggle
local function _29_(opt)
  local function _30_()
    _G.vim.opt_local["opt"] = not _G.vim.opt_local[opt]:get()
    return nil
  end
  return _30_
end
toggle = _29_
_G.vim.keymap.set({"n"}, "<leader>us", toggle("spell"), {desc = "Toggle spell"})
_G.vim.keymap.set({"n"}, "<leader>uw", toggle("wrap"), {desc = "Toggle wrap"})
_G.vim.keymap.set({"n"}, "<leader>ur", toggle("relativenumber"), {desc = "Toggle relative numbers"})
_G.vim.keymap.set({"n"}, "<leader>un", toggle("number"), {desc = "Toggle line numbers"})
_G.vim.keymap.set({"n"}, "<leader>ux", "<cmd>TSContextToggle<cr>", {desc = "Toggle context"})
_G.vim.keymap.set({"n"}, "<leader>ub", "<cmd>Barbecue toggle<cr>", {desc = "Toggle breadcrumbs"})
local function _31_()
  return _G.Snacks.zen()
end
_G.vim.keymap.set({"n"}, "<leader>uz", _31_, {desc = "Toggle zen mode"})
local function _32_()
  if _G.Snacks.dim.enabled then
    return _G.Snacks.dim.disable()
  else
    return _G.Snacks.dim.enable()
  end
end
_G.vim.keymap.set({"n"}, "<leader>ud", _32_, {desc = "Toggle dim"})
local function _34_()
  if (_G.vim.opt_local.conceallevel:get() == 0) then
    _G.vim.opt_local["conceallevel"] = 3
    return nil
  else
    _G.vim.opt_local["conceallevel"] = 0
    return nil
  end
end
return _G.vim.keymap.set({"n"}, "<leader>uh", _34_, {desc = "Toggle conceal"})

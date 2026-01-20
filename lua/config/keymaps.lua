-- :fennel:1768887988
vim.keymap.set({"n", "i", "x", "s"}, "<C-s>", "<cmd>:silent w<cr><esc>", {desc = "Save file", silent = true})
vim.keymap.set({"n"}, "<leader>s", "<cmd>:silent w<cr><esc>", {desc = "Save file", silent = true})
vim.keymap.set({"n"}, "<leader>l", "<cmd>Lazy<cr>", {desc = "Lazy", silent = true})
vim.keymap.set({"n"}, "<leader>m", "<cmd>Mason<cr>", {desc = "Mason", silent = true})
local function _1_()
  return _G.Snacks.lazygit()
end
vim.keymap.set({"n", "t"}, "<leader>g", _1_, {desc = "Lazygit", silent = true})
local function _2_()
  return _G.Snacks.terminal(nil, {win = {position = "bottom", height = 0.3}})
end
vim.keymap.set({"n"}, "<leader>th", _2_, {desc = "Horizontal terminal", silent = true})
local function _3_()
  return _G.Snacks.terminal(nil, {win = {position = "right", width = 0.4}})
end
vim.keymap.set({"n"}, "<leader>tv", _3_, {desc = "Vertical terminal", silent = true})
local function _4_()
  return _G.Snacks.terminal(nil, {win = {position = "bottom", height = 0.3}})
end
vim.keymap.set({"n"}, "<leader>t-", _4_, {desc = "Horizontal terminal", silent = true})
local function _5_()
  return _G.Snacks.terminal(nil, {win = {position = "right", width = 0.4}})
end
vim.keymap.set({"n"}, "<leader>t\\", _5_, {desc = "Vertical terminal", silent = true})
local function _6_()
  return _G.Snacks.terminal(nil, {win = {position = "float"}})
end
vim.keymap.set({"n"}, "<leader>tf", _6_, {desc = "Floating terminal", silent = true})
vim.keymap.set({"t"}, "<esc>", "<C-\\><C-n>", {desc = "Enter normal mode", silent = true})
local function _7_()
  return _G.Snacks.terminal.toggle()
end
vim.keymap.set({"n", "i", "x", "s", "t"}, "<C-\\>", _7_, {desc = "Toggle terminal", silent = true})
vim.keymap.set({"n"}, "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", {desc = "Trouble", silent = true})
vim.keymap.set({"n"}, "<leader>xq", "<cmd>Trouble qflist toggle<cr>", {desc = "Quickfix", silent = true})
vim.keymap.set({"n"}, "<leader>xl", "<cmd>Trouble loclist toggle<cr>", {desc = "Location list", silent = true})
local function _8_()
  return _G.Snacks.explorer()
end
vim.keymap.set({"n"}, "<leader>e", _8_, {desc = "Explorer", silent = true})
local function _9_()
  return _G.Snacks.picker.files()
end
vim.keymap.set({"n"}, "<leader>ff", _9_, {desc = "Find files", silent = true})
local function _10_()
  return _G.Snacks.picker.files[{cwd = "$HOME/.config/nvim"}]()
end
vim.keymap.set({"n"}, "<leader>fc", _10_, {desc = "Config files", silent = true})
local function _11_()
  return _G.Snacks.picker.colorschemes()
end
vim.keymap.set({"n"}, "<leader>fs", _11_, {desc = "Find colorscheme", silent = true})
local function _12_()
  return _G.Snacks.picker.recent()
end
vim.keymap.set({"n"}, "<leader>fr", _12_, {desc = "Recent files", silent = true})
local function _13_()
  return _G.Snacks.picker.undo()
end
vim.keymap.set({"n"}, "<leader>fu", _13_, {desc = "Undo history", silent = true})
local function _14_()
  return _G.Snacks.picker.grep()
end
vim.keymap.set({"n"}, "<leader>ft", _14_, {desc = "Grep", silent = true})
local function _15_()
  return _G.Snacks.picker.man()
end
vim.keymap.set({"n"}, "<leader>fm", _15_, {desc = "Find man pages", silent = true})
local function _16_()
  return _G.Snacks.picker.keymaps()
end
vim.keymap.set({"n"}, "<leader>fk", _16_, {desc = "Find keymaps", silent = true})
local function _17_()
  return _G.Snacks.picker.lines()
end
vim.keymap.set({"n"}, "<leader>fb", _17_, {desc = "Search buffer lines", silent = true})
local function _18_()
  return _G.Snacks.picker.git_log()
end
vim.keymap.set({"n"}, "<leader>fg", _18_, {desc = "Search Git commits", silent = true})
local function _19_()
  return _G.Snacks.picker.lsp_symbols()
end
vim.keymap.set({"n"}, "<leader>fa", _19_, {desc = "Search symbols", silent = true})
local function _20_()
  return _G.Snacks.picker.help()
end
vim.keymap.set({"n"}, "<leader>fh", _20_, {desc = "Search help tags", silent = true})
vim.keymap.set({"n"}, "<leader>ww", "<C-w>w", {desc = "Other window", silent = true})
vim.keymap.set({"n"}, "<leader>wd", "<C-w>c", {desc = "Delete window", silent = true})
vim.keymap.set({"n"}, "<leader>wh", "<C-w>s", {desc = "Split window horizontally", silent = true})
vim.keymap.set({"n"}, "<leader>wv", "<C-w>v", {desc = "Split window vertically", silent = true})
vim.keymap.set({"n"}, "<leader>w-", "<C-w>s", {desc = "Split window horizontally", silent = true})
vim.keymap.set({"n"}, "<leader>w\\", "<C-w>v", {desc = "Split window vertically", silent = true})
vim.keymap.set({"n"}, "[b", "<cmd>bprevious<cr>", {desc = "Prev buffer", silent = true})
vim.keymap.set({"n"}, "]b", "<cmd>bnext<cr>", {desc = "Next buffer", silent = true})
vim.keymap.set({"n"}, "<leader>bp", "<cmd>bprevious<cr>", {desc = "Prev buffer", silent = true})
vim.keymap.set({"n"}, "<leader>bn", "<cmd>bnext<cr>", {desc = "Next buffer", silent = true})
vim.keymap.set({"n"}, "<leader>bb", "<cmd>e #<cr>", {desc = "Other buffer", silent = true})
vim.keymap.set({"n"}, "<leader>bd", "<cmd>bdelete<cr>", {desc = "Delete buffer", silent = true})
vim.keymap.set({"n"}, "<leader><tab>l", "<cmd>tablast<cr>", {desc = "Last tab", silent = true})
vim.keymap.set({"n"}, "<leader><tab>f", "<cmd>tabfirst<cr>", {desc = "First tab", silent = true})
vim.keymap.set({"n"}, "<leader><tab><tab>", "<cmd>tabnew<cr>", {desc = "New tab", silent = true})
vim.keymap.set({"n"}, "<leader><tab>d", "<cmd>tabclose<cr>", {desc = "Delete tab", silent = true})
vim.keymap.set({"n"}, "<leader><tab>n", "<cmd>tabnext<cr>", {desc = "Next tab", silent = true})
vim.keymap.set({"n"}, "<leader><tab>p", "<cmd>tabprevious<cr>", {desc = "Prev tab", silent = true})
vim.keymap.set({"n"}, "]<tab>", "<cmd>tabnext<cr>", {desc = "Next tab", silent = true})
vim.keymap.set({"n"}, "[<tab>", "<cmd>tabprevious<cr>", {desc = "Prev tab", silent = true})
vim.keymap.set({"n"}, "<leader>qq", "<cmd>qa<cr>", {desc = "Quit all", silent = true})
vim.keymap.set({"n"}, "<leader>qw", "<C-w>c", {desc = "Quit window", silent = true})
vim.keymap.set({"n"}, "<leader>qb", "<cmd>bdelete<cr>", {desc = "Quit buffer", silent = true})
vim.keymap.set({"n"}, "<leader>qt", "<cmd>tabclose<cr>", {desc = "Quit tab", silent = true})
vim.keymap.set({"n"}, "<leader>q<tab>", "<cmd>tabclose<cr>", {desc = "Quit tab", silent = true})
do
  local sev
  local function _21_(severity)
    if severity then
      return vim.diagnostic.severity[severity]
    else
      return nil
    end
  end
  sev = _21_
  local next
  local function _23_(severity)
    local function _24_()
      return vim.diagnostic.goto_next({severity = sev(severity)})
    end
    return _24_
  end
  next = _23_
  local prev
  local function _25_(severity)
    local function _26_()
      return vim.diagnostic.goto_prev({severity = sev(severity)})
    end
    return _26_
  end
  prev = _25_
  vim.keymap.set({"n"}, "]d", next(), {desc = "Next diagnostic", silent = true})
  vim.keymap.set({"n"}, "[d", prev(), {desc = "Prev diagnostic", silent = true})
  vim.keymap.set({"n"}, "]e", next("ERROR"), {desc = "Next error", silent = true})
  vim.keymap.set({"n"}, "[e", prev("ERROR"), {desc = "Prev error", silent = true})
  vim.keymap.set({"n"}, "]w", next("WARN"), {desc = "Next warning", silent = true})
  vim.keymap.set({"n"}, "[w", prev("WARN"), {desc = "Prev warning", silent = true})
end
local toggle
local function _27_(opt)
  local function _28_()
    vim.opt_local[opt] = not vim.opt_local[opt]:get()
    return nil
  end
  return _28_
end
toggle = _27_
vim.keymap.set({"n"}, "<leader>us", toggle("spell"), {desc = "Toggle spell", silent = true})
vim.keymap.set({"n"}, "<leader>uw", toggle("wrap"), {desc = "Toggle wrap", silent = true})
vim.keymap.set({"n"}, "<leader>ur", toggle("relativenumber"), {desc = "Toggle relative numbers", silent = true})
vim.keymap.set({"n"}, "<leader>un", toggle("number"), {desc = "Toggle line numbers", silent = true})
vim.keymap.set({"n"}, "<leader>ux", "<cmd>TSContextToggle<cr>", {desc = "Toggle context", silent = true})
vim.keymap.set({"n"}, "<leader>ub", "<cmd>Barbecue toggle<cr>", {desc = "Toggle breadcrumbs", silent = true})
local function _29_()
  return _G.Snacks.zen()
end
vim.keymap.set({"n"}, "<leader>uz", _29_, {desc = "Toggle zen mode", silent = true})
local function _30_()
  if _G.Snacks.dim.enabled then
    return _G.Snacks.dim.disable()
  else
    return _G.Snacks.dim.enable()
  end
end
vim.keymap.set({"n"}, "<leader>ud", _30_, {desc = "Toggle dim", silent = true})
local function _32_()
  if (vim.opt_local.conceallevel:get() == 0) then
    vim.opt_local["conceallevel"] = 3
    return nil
  else
    vim.opt_local["conceallevel"] = 0
    return nil
  end
end
return vim.keymap.set({"n"}, "<leader>uh", _32_, {desc = "Toggle conceal", silent = true})
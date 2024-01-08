-- :fennel:1704405130
do
  local wk = require("which-key")
  wk.register({t = {name = "+terminal"}, x = {name = "+trouble"}, h = {name = "+git"}, b = {name = "+buffer", s = "+swap"}, f = {name = "+find"}, q = {name = "+quit"}, u = {name = "+toggle"}, ["<tab>"] = {name = "+tab"}, w = {name = "+window"}}, {prefix = "<leader>"})
  wk.register({z = {name = "+fold"}, g = {name = "+goto"}, ["]"] = {name = "+next"}, ["["] = {name = "+prev"}})
end
vim.keymap.set({"n", "i", "x", "s"}, "<C-s>", "<cmd>:silent w<cr><esc>", {desc = "Save file", silent = true})
vim.keymap.set({"n"}, "<leader>l", "<cmd>Lazy<cr>", {desc = "Lazy", silent = true})
vim.keymap.set({"n"}, "<leader>M", "<cmd>Mason<cr>", {desc = "Mason", silent = true})
vim.keymap.set({"n", "v"}, "<leader>m", "<cmd>MCstart<cr>", {desc = "Multicursors", silent = true})
vim.keymap.set({"n"}, "<leader>a", "<cmd>AerialToggle!<cr>", {desc = "Aerial", silent = true})
do
  local terminal = require("toggleterm.terminal").Terminal
  local lazygit = terminal:new({cmd = "lazygit", close_on_exit = true, direction = "tab", dir = "git_dir"})
  local function _1_()
    return lazygit:toggle()
  end
  vim.api.nvim_create_user_command("Lazygit", _1_, {force = true})
end
vim.keymap.set({"n"}, "<leader>tg", "<cmd>Lazygit<cr>", {desc = "Launch lazygit", silent = true})
vim.keymap.set({"n"}, "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", {desc = "Horizontal terminal", silent = true})
vim.keymap.set({"n"}, "<leader>tv", "<cmd>ToggleTerm direction=vertical size=70<cr>", {desc = "Vertical terminal", silent = true})
vim.keymap.set({"n"}, "<leader>t-", "<cmd>ToggleTerm direction=horizontal<cr>", {desc = "Horizontal terminal", silent = true})
vim.keymap.set({"n"}, "<leader>t\\", "<cmd>ToggleTerm direction=vertical size=70<cr>", {desc = "Vertical terminal", silent = true})
vim.keymap.set({"n"}, "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", {desc = "Floating terminal", silent = true})
vim.keymap.set({"t"}, "<C-e>", "<C-\\><C-n>", {desc = "Enter normal mode", silent = true})
vim.keymap.set({"n", "i", "x", "s", "t"}, "<C-\\>", "<cmd>ToggleTermToggleAll<cr>", {desc = "Toggle terminal", silent = true})
vim.keymap.set({"n"}, "<leader>xx", "<cmd>TroubleToggle<cr>", {desc = "Trouble", silent = true})
vim.keymap.set({"n"}, "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", {desc = "Workspace diagnostics", silent = true})
vim.keymap.set({"n"}, "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", {desc = "Document diagnostics", silent = true})
vim.keymap.set({"n"}, "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", {desc = "Quickfix", silent = true})
vim.keymap.set({"n"}, "<leader>xl", "<cmd>TroubleToggle loclist<cr>", {desc = "Location list", silent = true})
vim.keymap.set({"n"}, "<leader>e", "<cmd>Neotree toggle<cr>", {desc = "Neotree", silent = true})
do
  local splits = require("smart-splits")
  vim.keymap.set({"n"}, "<A-h>", splits.resize_left, {desc = "Resize left", silent = true})
  vim.keymap.set({"n"}, "<A-j>", splits.resize_down, {desc = "Resize down", silent = true})
  vim.keymap.set({"n"}, "<A-k>", splits.resize_up, {desc = "Resize up", silent = true})
  vim.keymap.set({"n"}, "<A-l>", splits.resize_right, {desc = "Resize right", silent = true})
  vim.keymap.set({"n"}, "<C-h>", splits.move_cursor_left, {desc = "Move left", silent = true})
  vim.keymap.set({"n"}, "<C-j>", splits.move_cursor_down, {desc = "Move left", silent = true})
  vim.keymap.set({"n"}, "<C-k>", splits.move_cursor_up, {desc = "Move left", silent = true})
  vim.keymap.set({"n"}, "<C-l>", splits.move_cursor_right, {desc = "Move left", silent = true})
  vim.keymap.set({"n"}, "bsh", splits.swap_buf_left, {desc = "Swap left", silent = true})
  vim.keymap.set({"n"}, "bsj", splits.swap_buf_down, {desc = "Swap down", silent = true})
  vim.keymap.set({"n"}, "bsk", splits.swap_buf_up, {desc = "Swap up", silent = true})
  vim.keymap.set({"n"}, "bsl", splits.swap_buf_right, {desc = "Swap right", silent = true})
end
do
  local ufo = require("ufo")
  vim.keymap.set({"n"}, "zR", ufo.openAllFolds, {desc = "Open all folds", silent = true})
  vim.keymap.set({"n"}, "zM", ufo.closeAllFolds, {desc = "Close all folds", silent = true})
end
vim.keymap.set({"n"}, "<leader>ff", "<cmd>Telescope find_files<cr>", {desc = "Find files", silent = true})
vim.keymap.set({"n"}, "<leader>fc", "<cmd>Telescope find_files cwd=$HOME/.config/nvim<cr>", {desc = "Config files", silent = true})
vim.keymap.set({"n"}, "<leader>fs", "<cmd>Telescope colorscheme enable_preview=true<cr>", {desc = "Find colorscheme", silent = true})
vim.keymap.set({"n"}, "<leader>fr", "<cmd>Telescope oldfiles<cr>", {desc = "Recent files", silent = true})
vim.keymap.set({"n"}, "<leader>fu", "<cmd>Telescope undo<cr>", {desc = "Undo history", silent = true})
vim.keymap.set({"n"}, "<leader>fy", "<cmd>Telescope yank_history<cr>", {desc = "Yank history", silent = true})
vim.keymap.set({"n"}, "<leader>fm", "<cmd>Telescope man_pages<cr>", {desc = "Find man pages", silent = true})
vim.keymap.set({"n"}, "<leader>fk", "<cmd>Telescope keymaps<cr>", {desc = "Find keymaps", silent = true})
vim.keymap.set({"n"}, "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", {desc = "Search buffer", silent = true})
vim.keymap.set({"n"}, "<leader>fg", "<cmd>Telescope git_commits<cr>", {desc = "Search Git commits", silent = true})
vim.keymap.set({"n"}, "<leader>fa", "<cmd>Telescope aerial<cr>", {desc = "Search symbols", silent = true})
vim.keymap.set({"n"}, "<leader>fh", "<cmd>Telescope help_tags<cr>", {desc = "Search help tags", silent = true})
do
  local flash = require("flash")
  vim.keymap.set({"n", "o", "x"}, "s", flash.jump, {desc = "Flash", silent = true})
  vim.keymap.set({"n", "o", "x"}, "S", flash.treesitter, {desc = "Flash Treesitter", silent = true})
  vim.keymap.set({"c"}, "<C-e>", flash.toggle, {desc = "Toggle Flash search", silent = true})
end
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
  local function _2_(severity)
    if severity then
      return vim.diagnostic.severity[severity]
    else
      return nil
    end
  end
  sev = _2_
  local next
  local function _4_(severity)
    local function _5_()
      return vim.diagnostic.goto_next({severity = sev(severity)})
    end
    return _5_
  end
  next = _4_
  local prev
  local function _6_(severity)
    local function _7_()
      return vim.diagnostic.goto_prev({severity = sev(severity)})
    end
    return _7_
  end
  prev = _6_
  vim.keymap.set({"n"}, "]d", next(), {desc = "Next diagnostic", silent = true})
  vim.keymap.set({"n"}, "[d", prev(), {desc = "Prev diagnostic", silent = true})
  vim.keymap.set({"n"}, "]e", next("ERROR"), {desc = "Next error", silent = true})
  vim.keymap.set({"n"}, "[e", prev("ERROR"), {desc = "Prev error", silent = true})
  vim.keymap.set({"n"}, "]w", next("WARN"), {desc = "Next warning", silent = true})
  vim.keymap.set({"n"}, "[w", prev("WARN"), {desc = "Prev warning", silent = true})
end
local toggle
local function _8_(opt)
  local function _9_()
    vim.opt_local[opt] = not (vim.opt_local[opt]):get()
    return nil
  end
  return _9_
end
toggle = _8_
vim.keymap.set({"n"}, "<leader>us", toggle("spell"), {desc = "Toggle spell", silent = true})
vim.keymap.set({"n"}, "<leader>uw", toggle("wrap"), {desc = "Toggle wrap", silent = true})
vim.keymap.set({"n"}, "<leader>ur", toggle("relativenumber"), {desc = "Toggle relative numbers", silent = true})
return vim.keymap.set({"n"}, "<leader>un", toggle("number"), {desc = "Toggle line numbers", silent = true})
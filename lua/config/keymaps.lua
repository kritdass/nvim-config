-- :fennel:1708479509
vim.keymap.set({"n", "i", "x", "s"}, "<C-s>", "<cmd>:silent w<cr><esc>", {desc = "Save file", silent = true})
vim.keymap.set({"n"}, "<leader>s", "<cmd>:silent w<cr><esc>", {desc = "Save file", silent = true})
vim.keymap.set({"n"}, "<leader>l", "<cmd>Lazy<cr>", {desc = "Lazy", silent = true})
vim.keymap.set({"n"}, "<leader>m", "<cmd>Mason<cr>", {desc = "Mason", silent = true})
vim.keymap.set({"n"}, "<leader>o", "<cmd>Neotree document_symbols toggle position=right<cr>", {desc = "Outline", silent = true})
vim.keymap.set({"n", "t"}, "<leader>g", "<cmd>Lazygit<cr>", {desc = "Launch lazygit", silent = true})
vim.keymap.set({"n", "t"}, "<leader>tg", "<cmd>Lazygit<cr>", {desc = "Launch lazygit", silent = true})
vim.keymap.set({"n"}, "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", {desc = "Horizontal terminal", silent = true})
vim.keymap.set({"n"}, "<leader>tv", "<cmd>ToggleTerm direction=vertical size=70<cr>", {desc = "Vertical terminal", silent = true})
vim.keymap.set({"n"}, "<leader>t-", "<cmd>ToggleTerm direction=horizontal<cr>", {desc = "Horizontal terminal", silent = true})
vim.keymap.set({"n"}, "<leader>t\\", "<cmd>ToggleTerm direction=vertical size=70<cr>", {desc = "Vertical terminal", silent = true})
vim.keymap.set({"n"}, "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", {desc = "Floating terminal", silent = true})
vim.keymap.set({"n"}, "<leader>tt", "<cmd>ToggleTerm direction=tab<cr>", {desc = "Tab terminal", silent = true})
vim.keymap.set({"t"}, "<esc>", "<C-\\><C-n>", {desc = "Enter normal mode", silent = true})
vim.keymap.set({"n", "i", "x", "s", "t"}, "<C-\\>", "<cmd>ToggleTermToggleAll<cr>", {desc = "Toggle terminal", silent = true})
vim.keymap.set({"n"}, "<leader>xx", "<cmd>TroubleToggle<cr>", {desc = "Trouble", silent = true})
vim.keymap.set({"n"}, "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", {desc = "Workspace diagnostics", silent = true})
vim.keymap.set({"n"}, "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", {desc = "Document diagnostics", silent = true})
vim.keymap.set({"n"}, "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", {desc = "Quickfix", silent = true})
vim.keymap.set({"n"}, "<leader>xl", "<cmd>TroubleToggle loclist<cr>", {desc = "Location list", silent = true})
vim.keymap.set({"n"}, "<leader>e", "<cmd>Neotree toggle<cr>", {desc = "Neotree", silent = true})
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
  local function _1_(severity)
    if severity then
      return vim.diagnostic.severity[severity]
    else
      return nil
    end
  end
  sev = _1_
  local next
  local function _3_(severity)
    local function _4_()
      return vim.diagnostic.goto_next({severity = sev(severity)})
    end
    return _4_
  end
  next = _3_
  local prev
  local function _5_(severity)
    local function _6_()
      return vim.diagnostic.goto_prev({severity = sev(severity)})
    end
    return _6_
  end
  prev = _5_
  vim.keymap.set({"n"}, "]d", next(), {desc = "Next diagnostic", silent = true})
  vim.keymap.set({"n"}, "[d", prev(), {desc = "Prev diagnostic", silent = true})
  vim.keymap.set({"n"}, "]e", next("ERROR"), {desc = "Next error", silent = true})
  vim.keymap.set({"n"}, "[e", prev("ERROR"), {desc = "Prev error", silent = true})
  vim.keymap.set({"n"}, "]w", next("WARN"), {desc = "Next warning", silent = true})
  vim.keymap.set({"n"}, "[w", prev("WARN"), {desc = "Prev warning", silent = true})
end
local toggle
local function _7_(opt)
  local function _8_()
    vim.opt_local[opt] = not (vim.opt_local[opt]):get()
    return nil
  end
  return _8_
end
toggle = _7_
vim.keymap.set({"n"}, "<leader>us", toggle("spell"), {desc = "Toggle spell", silent = true})
vim.keymap.set({"n"}, "<leader>uw", toggle("wrap"), {desc = "Toggle wrap", silent = true})
vim.keymap.set({"n"}, "<leader>ur", toggle("relativenumber"), {desc = "Toggle relative numbers", silent = true})
vim.keymap.set({"n"}, "<leader>un", toggle("number"), {desc = "Toggle line numbers", silent = true})
vim.keymap.set({"n"}, "<leader>uc", "<cmd>ColorizerToggle<cr>", {desc = "Toggle colorizer", silent = true})
vim.keymap.set({"n"}, "<leader>ux", "<cmd>TSContextToggle<cr>", {desc = "Toggle context", silent = true})
vim.keymap.set({"n"}, "<leader>ub", "<cmd>Barbecue toggle<cr>", {desc = "Toggle breadcrumbs", silent = true})
local function _9_()
  if ((vim.opt_local.conceallevel):get() == 0) then
    vim.opt_local["conceallevel"] = 3
    return nil
  else
    vim.opt_local["conceallevel"] = 0
    return nil
  end
end
return vim.keymap.set({"n"}, "<leader>uh", _9_, {desc = "Toggle conceal", silent = true})
-- :fennel:1707173589
vim.cmd("colorscheme onedark_vivid")
do end (vim.opt)["number"] = true
vim.opt["relativenumber"] = true
vim.opt["cursorline"] = true
vim.opt["laststatus"] = 3
vim.opt["signcolumn"] = "yes"
vim.opt["tabstop"] = 4
vim.opt["softtabstop"] = 4
vim.opt["shiftwidth"] = 4
vim.opt["shiftround"] = true
vim.opt["smartindent"] = true
vim.opt["expandtab"] = true
vim.opt["wrap"] = false
vim.opt["mouse"] = "a"
vim.opt["swapfile"] = false
vim.opt["backup"] = false
vim.opt["undofile"] = true
vim.opt["writebackup"] = false
vim.opt["incsearch"] = true
vim.opt["hlsearch"] = false
vim.opt["ignorecase"] = true
vim.opt["smartcase"] = true
vim.opt["termguicolors"] = true
vim.opt["spelllang"] = "en"
vim.opt["fileencoding"] = "utf-8"
vim.opt["guifont"] = "JetBrainsMono Nerd Font:h13"
vim.opt["clipboard"] = "unnamedplus"
vim.opt["completeopt"] = "menu,menuone,noselect"
vim.opt["confirm"] = true
vim.opt["conceallevel"] = 3
vim.opt["showmode"] = false
vim.opt["grepformat"] = "%f:%l:%c:%m"
vim.opt["grepprg"] = "rg --vimgrep"
vim.opt["timeout"] = true
vim.opt["timeoutlen"] = 300
vim.opt["updatetime"] = 300
do end (vim.opt.shortmess):append("c")
do end (vim.opt)["scrolloff"] = 8
vim.opt["sidescrolloff"] = 8
if (vim.fn.has("nvim-0.10") == 1) then
  vim.opt["smoothscroll"] = true
else
end
vim.opt["splitkeep"] = "screen"
vim.opt["splitbelow"] = true
vim.opt["splitright"] = true
vim.opt["cmdheight"] = 2
vim.opt["pumheight"] = 10
vim.opt["foldenable"] = true
vim.opt["foldlevel"] = 99
vim.opt["foldlevelstart"] = 99
vim.opt["foldcolumn"] = "1"
vim.opt["fillchars"] = {eob = " ", foldopen = "\239\145\188", foldsep = " ", foldclose = "\239\145\160"}
local signs = {Hint = "\243\176\140\181", Info = "\243\176\153\142", Warn = "\238\153\148", Error = "\238\170\135"}
for type, icon in pairs(signs) do
  local hl = ("DiagnosticSign" .. type)
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end
return nil
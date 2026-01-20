-- [nfnl] fnl/config/options.fnl
_G.vim.cmd.colorscheme("onelight")
_G.vim.opt["number"] = true
_G.vim.opt["relativenumber"] = true
_G.vim.opt["cursorline"] = true
_G.vim.opt["laststatus"] = 3
_G.vim.opt["signcolumn"] = "yes"
_G.vim.opt["tabstop"] = 4
_G.vim.opt["softtabstop"] = 4
_G.vim.opt["shiftwidth"] = 4
_G.vim.opt["shiftround"] = true
_G.vim.opt["smartindent"] = true
_G.vim.opt["expandtab"] = true
_G.vim.opt["wrap"] = false
_G.vim.opt["mouse"] = "a"
_G.vim.opt["swapfile"] = false
_G.vim.opt["backup"] = false
_G.vim.opt["undofile"] = true
_G.vim.opt["writebackup"] = false
_G.vim.opt["incsearch"] = true
_G.vim.opt["hlsearch"] = false
_G.vim.opt["ignorecase"] = true
_G.vim.opt["smartcase"] = true
_G.vim.opt["termguicolors"] = true
_G.vim.opt["spelllang"] = "en"
_G.vim.opt["fileencoding"] = "utf-8"
_G.vim.opt["guifont"] = "JetBrainsMono Nerd Font:h13"
_G.vim.opt["clipboard"] = "unnamedplus"
_G.vim.opt["completeopt"] = "menu,menuone,noselect"
_G.vim.opt["confirm"] = true
_G.vim.opt["conceallevel"] = 3
_G.vim.opt["showmode"] = false
_G.vim.opt["grepformat"] = "%f:%l:%c:%m"
_G.vim.opt["grepprg"] = "rg --vimgrep"
_G.vim.opt["timeout"] = true
_G.vim.opt["timeoutlen"] = 300
_G.vim.opt["updatetime"] = 300
_G.vim.opt.shortmess:append("c")
_G.vim.opt["scrolloff"] = 8
_G.vim.opt["sidescrolloff"] = 8
if (_G.vim.fn.has("nvim-0.10") == 1) then
  _G.vim.opt["smoothscroll"] = true
else
end
_G.vim.opt["splitkeep"] = "screen"
_G.vim.opt["splitbelow"] = true
_G.vim.opt["splitright"] = true
_G.vim.opt["cmdheight"] = 2
_G.vim.opt["pumheight"] = 10
_G.vim.opt["foldenable"] = true
_G.vim.opt["foldlevel"] = 99
_G.vim.opt["foldlevelstart"] = 99
_G.vim.opt["foldcolumn"] = "1"
_G.vim.opt["fillchars"] = {eob = " ", foldopen = "\239\145\188", foldsep = " ", foldclose = "\239\145\160"}
local signs = {Hint = "\243\176\140\181", Info = "\243\176\153\142", Warn = "\238\153\148", Error = "\238\170\135"}
for type, icon in pairs(signs) do
  local hl = ("DiagnosticSign" .. type)
  _G.vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end
return nil

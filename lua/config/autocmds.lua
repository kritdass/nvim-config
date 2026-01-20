-- [nfnl] fnl/config/autocmds.fnl
do
  local group_1_ = _G.vim.api.nvim_create_augroup("highlight-yank", {clear = true})
  local function _2_()
    return _G.vim.highlight.on_yank()
  end
  _G.vim.api.nvim_create_autocmd({"TextYankPost"}, {callback = _2_, desc = "Highlight selection on yank", group = group_1_, pattern = "*"})
end
do
  local group_3_ = _G.vim.api.nvim_create_augroup("wrap-spell", {clear = true})
  local function _4_()
    _G.vim.opt_local["wrap"] = true
    _G.vim.opt_local["spell"] = true
    return nil
  end
  _G.vim.api.nvim_create_autocmd({"FileType"}, {callback = _4_, group = group_3_, pattern = {"markdown", "tex", "text", "trouble", "typst"}})
end
local group_5_ = _G.vim.api.nvim_create_augroup("typst-preview", {clear = true})
_G.vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {command = "TypstPreview", group = group_5_, pattern = "*.typ"})
return _G.vim.api.nvim_create_autocmd({"BufWipeout"}, {command = "TypstPreviewStop", group = group_5_, pattern = "*.typ"})

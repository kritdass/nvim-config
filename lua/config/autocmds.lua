-- :fennel:1763314830
do
  local augid_1_ = vim.api.nvim_create_augroup("highlight-yank", {clear = true})
  local function _2_()
    return vim.highlight.on_yank()
  end
  vim.api.nvim_create_autocmd({"TextYankPost"}, {callback = _2_, desc = "Highlight selection on yank", group = augid_1_, pattern = "*"})
end
do
  local augid_3_ = vim.api.nvim_create_augroup("wrap-spell", {clear = true})
  local function _4_()
    vim.opt_local["wrap"] = true
    vim.opt_local["spell"] = true
    return nil
  end
  vim.api.nvim_create_autocmd({"FileType"}, {callback = _4_, group = augid_3_, pattern = {"markdown", "tex", "text", "trouble", "typst"}})
end
require("colorizer").setup()
local augid_5_ = vim.api.nvim_create_augroup("typst-preview", {clear = true})
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {command = "TypstPreview", group = augid_5_, pattern = "*.typ"})
return vim.api.nvim_create_autocmd({"BufWipeout"}, {command = "TypstPreviewStop", group = augid_5_, pattern = "*.typ"})
-- :fennel:1707018206
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
  vim.api.nvim_create_autocmd({"FileType"}, {callback = _4_, group = augid_3_, pattern = {"markdown"}})
end
return require("colorizer").setup()
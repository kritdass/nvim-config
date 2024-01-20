-- :fennel:1705787927
local function _1_()
  return vim.fn["mkdp#util#install"]()
end
return {"iamcco/markdown-preview.nvim", cmd = {"MarkdownPreview"}, ft = {"markdown"}, build = _1_}
-- :fennel:1704135981
local function _1_(plugin)
  require("lazy.core.loader").add_to_rtp(plugin)
  return require("nvim-treesitter.query_predicates")
end
local function _2_(_, opts)
  return require("nvim-treesitter.configs").setup(opts)
end
return {"nvim-treesitter/nvim-treesitter", event = {"BufRead", "BufNewFile"}, build = ":TSUpdate", init = _1_, opts = {highlight = {enable = true}, indent = {enable = true}, auto_install = true, ensure_installed = {"c", "lua", "vim", "vimdoc", "query"}, sync_install = false}, config = _2_, version = false}
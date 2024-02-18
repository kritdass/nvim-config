-- :fennel:1708280435
local textobj_opts = {textobjects = {select = {enable = true, lookahead = true, keymaps = {af = {query = "@function.outer", desc = "a function"}, ["if"] = {query = "@function.inner", desc = "inner function"}, ac = {query = "@class.outer", desc = "a class"}, ic = {query = "@class.inner", desc = "inner class"}}}}}
local function _1_()
  return require("nvim-treesitter.configs").setup(textobj_opts)
end
local function _2_(_, opts)
  return require("nvim-treesitter.configs").setup(opts)
end
return {"nvim-treesitter/nvim-treesitter", event = "VeryLazy", build = ":TSUpdate", dependencies = {"nvim-treesitter/nvim-treesitter-context", {"nvim-treesitter/nvim-treesitter-textobjects", config = _1_}}, opts = {highlight = {enable = true}, indent = {enable = true}, auto_install = true, ensure_installed = {"c", "lua", "vim", "vimdoc", "query"}, sync_install = false}, config = _2_, version = false}
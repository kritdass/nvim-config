-- [nfnl] fnl/plugins/treesitter.fnl
local function _1_()
  _G.vim.g["no_plugin_maps"] = true
  return nil
end
local function _2_(_, opts)
  return require("nvim-treesitter.configs").setup(opts)
end
return {"nvim-treesitter/nvim-treesitter", branch = "master", build = ":TSUpdate", event = {"BufReadPost", "BufNewFile", "VeryLazy"}, dependencies = {"nvim-treesitter/nvim-treesitter-context", {"nvim-treesitter/nvim-treesitter-textobjects", branch = "main", init = _1_}}, opts = {highlight = {enable = true}, indent = {enable = true}, auto_install = true, ensure_installed = {"c", "lua", "vim", "vimdoc", "query", "fennel"}, sync_install = false}, config = _2_, version = false}

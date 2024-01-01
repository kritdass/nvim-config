-- :fennel:1704135981
local function _1_()
  require("telescope").load_extension("fzf")
  require("telescope").load_extension("undo")
  require("telescope").load_extension("yank_history")
  return require("telescope").setup({defaults = {mappings = {i = {["<esc>"] = require("telescope.actions").close, ["<C-e>"] = require("telescope.actions").close}}}})
end
return {"nvim-telescope/telescope.nvim", cmd = "Telescope", dependencies = {"nvim-lua/plenary.nvim", {"nvim-telescope/telescope-fzf-native.nvim", build = "make"}, "debugloop/telescope-undo.nvim"}, config = _1_, version = false}
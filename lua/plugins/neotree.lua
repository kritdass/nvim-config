-- :fennel:1705787927
local function _1_()
  if (vim.fn.argc(-1) == 1) then
    local stat = vim.loop.fs_stat(vim.fn.argv(0))
    if (stat and (stat.type == "directory")) then
      return require("neo-tree")
    else
      return nil
    end
  else
    return nil
  end
end
return {"nvim-neo-tree/neo-tree.nvim", cmd = "Neotree", branch = "v3.x", dependencies = {"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim"}, init = _1_, opts = {close_if_last_window = true, default_component_configs = {diagnostics = {symbols = {hint = "\243\176\140\181", info = "\243\176\153\142", warn = "\238\153\148", error = "\238\170\135"}}}, window = {width = 30, mappings = {["<space>"] = "none"}}, filesystem = {follow_current_file = {enabled = true}, hijack_netrw_behavior = "open_current", use_libuv_file_watcher = true}}}
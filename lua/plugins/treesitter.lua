-- [nfnl] fnl/plugins/treesitter.fnl
local function _1_()
  _G.vim.g["no_plugin_maps"] = true
  return nil
end
local function _2_()
  do local _ = require("nvim-treesitter-textobjects").setup end
  return {select = {lookahead = true, selection_modes = {["@function.outer"] = "V", ["@class.outer"] = "V"}}}
end
local function _3_()
  local ts = require("nvim-treesitter")
  ts.install({"c", "lua", "vim", "vimdoc", "query", "fennel", "nix"})
  local group_4_ = _G.vim.api.nvim_create_augroup("Treesitter", {clear = true})
  local function _5_()
    local ft = _G.vim.bo.filetype
    local lang = _G.vim.treesitter.language.get_lang(ft)
    if lang then
      if pcall(_G.vim.treesitter.start) then
        _G.vim.bo["indentexpr"] = "v:lua.require'nvim-treesitter'.indentexpr()"
        return nil
      else
        return nil
      end
    else
      if (ft ~= "") then
        return pcall(ts.install, {ft})
      else
        return nil
      end
    end
  end
  return _G.vim.api.nvim_create_autocmd({"FileType"}, {callback = _5_, group = group_4_, pattern = "*"})
end
return {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", dependencies = {"nvim-treesitter/nvim-treesitter-context", {"nvim-treesitter/nvim-treesitter-textobjects", branch = "main", init = _1_, config = _2_}}, config = _3_, lazy = false}

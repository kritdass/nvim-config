-- [nfnl] fnl/plugins/vimtex.fnl
local function _1_()
  _G.vim.g["vimtex_compiler_method"] = "latexmk"
  _G.vim.g["vimtex_view_general_viewer"] = "sumatra"
  _G.vim.g["vimtex_view_general_options"] = "-reuse-instance @pdf"
  return nil
end
return {"lervag/vimtex", init = _1_, lazy = false}

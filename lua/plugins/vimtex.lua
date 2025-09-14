-- :fennel:1756501876
local function _1_()
  vim.g["vimtex_compiler_method"] = "latexmk"
  vim.g["vimtex_view_general_viewer"] = "sumatra"
  vim.g["vimtex_view_general_options"] = "-reuse-instance @pdf"
  return nil
end
return {"lervag/vimtex", init = _1_, lazy = false}
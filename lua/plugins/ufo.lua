-- :fennel:1707436565
local function handler(virt_text, lnum, end_lnum, width, truncate)
  local new_virt_text = {}
  local suffix = string.format(" \243\176\129\130 %d ", (end_lnum - lnum))
  local suf_width = vim.fn.strdisplaywidth(suffix)
  local target_width = (width - suf_width)
  local cur_width = 0
  for _, chunk in ipairs(virt_text) do
    local chunk_text = chunk[1]
    local chunk_width = vim.fn.strdisplaywidth(chunk_text)
    if (target_width > (cur_width + chunk_width)) then
      table.insert(new_virt_text, chunk)
    else
      chunk_text = truncate(chunk_text, (target_width - cur_width))
      table.insert(new_virt_text, {chunk_text, chunk[2]})
      chunk_width = vim.fn.strdisplaywidth(chunk_text)
      if ((cur_width + chunk_width) < target_width) then
        suffix = (suffix .. string.rep(" ", (target_width - cur_width - chunk_width)))
      else
      end
      break
    end
    cur_width = (cur_width + chunk_width)
  end
  table.insert(new_virt_text, {suffix, "MoreMsg"})
  return new_virt_text
end
local ft_exclude = {"help", "dashboard", "neo-tree", "Trouble", "lazy", "mason", "toggleterm"}
local function _3_()
  local builtin = require("statuscol.builtin")
  return require("statuscol").setup({ft_ignore = ft_exclude, relculright = true, segments = {{sign = {name = {"Diagnostic"}, maxwidth = 1, auto = true}, click = "v:lua.ScFa"}, {sign = {namespace = {"gitsigns"}, maxwidth = 1, auto = true}, click = "v:lua:ScSa"}, {text = {builtin.foldfunc, "  "}, click = "v:lua.ScFa"}, {sign = {maxwidth = 1, auto = true}, text = {builtin.lnumfunc, "  "}, click = "v:lua.ScLa"}}})
end
local function _4_(_, ft, _0)
  local nofold = {"markdown", "sh", "css", "html", "python", "fennel"}
  if vim.tbl_contains(nofold, ft) then
    return {"treesitter", "indent"}
  else
    return {"lsp", "indent"}
  end
end
return {"kevinhwang91/nvim-ufo", event = {"BufReadPost", "BufNewFile"}, dependencies = {"kevinhwang91/promise-async", {"luukvbaal/statuscol.nvim", config = _3_}}, opts = {fold_virt_text_handler = handler, provider_selector = _4_, filetype_exclude = ft_exclude}}
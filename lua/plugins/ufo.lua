-- :fennel:1768887988
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
local ft_exclude = {"help", "snacks_dashboard", "snacks_picker_list", "Trouble", "lazy", "mason", "snacks_terminal"}
local function _3_(_, ft, _0)
  local nofold = {"markdown", "sh", "css", "html", "python", "fennel"}
  if vim.tbl_contains(nofold, ft) then
    return {"treesitter", "indent"}
  else
    return {"lsp", "indent"}
  end
end
return {"kevinhwang91/nvim-ufo", event = {"BufReadPost", "BufNewFile"}, dependencies = {"kevinhwang91/promise-async"}, opts = {fold_virt_text_handler = handler, provider_selector = _3_, filetype_exclude = ft_exclude}}
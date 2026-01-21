-- [nfnl] fnl/plugins/lsp.fnl
local function _1_()
  local blink_capabilities = require("blink.cmp").get_lsp_capabilities
  return _G.vim.lsp.config("*", {capabilities = blink_capabilities({textDocument = {foldingRange = {lineFoldingOnly = true, dynamicRegistration = false}}})})
end
local _2_
do
  local map
  local function _3_(mode, key, action, desc)
    return {key, action, [mode] = "mode", desc = desc}
  end
  map = _3_
  local function _4_()
    if not require("ufo").peekFoldedLinesUnderCursor() then
      return _G.vim.lsp.buf.hover()
    else
      return nil
    end
  end
  map("n", "K", _4_, "Hover")
  map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", "Goto definition")
  map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", "Goto declaration")
  map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", "Goto implementation")
  map("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Goto type definition")
  map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", "Goto references")
  map("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename")
  map("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", "Format")
  map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code actions")
  _2_ = map("n", "<leader>ct", "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type definition")
end
return {{"mason-org/mason.nvim", cmd = "Mason", opts = {}}, {"neovim/nvim-lspconfig", event = {"BufReadPre", "BufNewFile"}, opts = {}, config = _1_, dependencies = {{"mason-org/mason-lspconfig.nvim", opts = {}}, "mason-org/mason-lspconfig.nvim"}, keys = _2_}, {"saghen/blink.cmp", event = {"BufReadPre", "BufNewFile"}, version = "1.*", dependencies = {"rafamadriz/friendly-snippets"}, opts = {keymap = {preset = "default", ["<Tab>"] = {"select_next", "fallback"}, ["<S-Tab>"] = {"select_next", "fallback"}, ["<CR>"] = {"accept", "fallback"}, ["<C-space>"] = {"show_documentation", "hide_documentation"}}, appearance = {nerd_font_variant = "normal"}, completion = {documentation = {auto_show = true}, ghost_text = {enabled = true}}, sources = {default = {"lsp", "path", "snippets", "buffer"}}}, opts_extend = {"sources.default"}}}

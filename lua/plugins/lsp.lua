-- :fennel:1768770680
local function _1_()
  do end (require("mason-lspconfig")).setup({automatic_installation = true})
  local function _2_(server)
    local lspconfig = require("lspconfig")
    local capabilities = (require("blink.cmp")).get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())
    local root_dir
    local function _3_(filename, bufnr)
      return (vim.fs.root(bufnr, {".git"}) or vim.fn.expand("%:p:h"))
    end
    root_dir = _3_
    capabilities.textDocument.foldingRange = {lineFoldingOnly = true, dynamicRegistration = false}
    return lspconfig[server].setup({capabilities = capabilities, root_dir = root_dir})
  end
  return (require("mason-lspconfig")).setup_handlers({_2_})
end
local function _4_()
  local augid_5_ = vim.api.nvim_create_augroup("lsp", {clear = true})
  local function _6_(event)
    local map
    local function _7_(mode, lhs, rhs, desc)
      return vim.keymap.set(mode, lhs, rhs, {buffer = event.buf, desc = desc})
    end
    map = _7_
    local function _8_()
      if not (require("ufo")).peekFoldedLinesUnderCursor() then
        return vim.lsp.buf.hover()
      else
        return nil
      end
    end
    map("n", "K", _8_, "Hover")
    map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", "Goto definition")
    map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", "Goto declaration")
    map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", "Goto implementation")
    map("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Goto type definition")
    map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", "Goto references")
    map("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename")
    map("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", "Format")
    map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code actions")
    return map("n", "<leader>ct", "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type definition")
  end
  return vim.api.nvim_create_autocmd({"LspAttach"}, {callback = _6_, desc = "Lsp actions", group = augid_5_, pattern = "*"})
end
return {{"williamboman/mason.nvim", build = ":MasonUpdate", opts = {}}, {"williamboman/mason-lspconfig.nvim", event = {"BufReadPre", "BufNewFile"}, config = _1_}, {"neovim/nvim-lspconfig", event = {"BufReadPre", "BufNewFile"}, cmd = {"LspInfo", "LspInstall", "LspUninstall"}, config = _4_}, {"saghen/blink.cmp", version = "1.*", dependencies = {"rafamadriz/friendly-snippets"}, opts = {keymap = {preset = "default", ["<Tab>"] = {"select_next", "fallback"}, ["<S-Tab>"] = {"select_next", "fallback"}, ["<CR>"] = {"accept", "fallback"}, ["<C-space>"] = {"show_documentation", "hide_documentation"}}, appearance = {nerd_font_variant = "normal"}, completion = {documentation = {auto_show = true}, ghost_text = {enabled = true}}, sources = {default = {"lsp", "path", "snippets", "buffer"}}}, opts_extend = {"sources.default"}}}
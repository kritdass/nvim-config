-- :fennel:1721574688
local function _1_()
  do end (require("mason-lspconfig")).setup({automatic_installation = true})
  local function _2_(server)
    local lspconfig = require("lspconfig")
    local capabilities = (require("cmp_nvim_lsp")).default_capabilities(vim.lsp.protocol.make_client_capabilities())
    capabilities.textDocument.foldingRange = {lineFoldingOnly = true, dynamicRegistration = false}
    return lspconfig[server].setup({capabilities = capabilities})
  end
  return (require("mason-lspconfig")).setup_handlers({_2_})
end
local function _3_()
  local augid_4_ = vim.api.nvim_create_augroup("lsp", {clear = true})
  local function _5_(event)
    local map
    local function _6_(mode, lhs, rhs, desc)
      return vim.keymap.set(mode, lhs, rhs, {buffer = event.buf, desc = desc})
    end
    map = _6_
    local function _7_()
      if not (require("ufo")).peekFoldedLinesUnderCursor() then
        return vim.lsp.buf.hover()
      else
        return nil
      end
    end
    map("n", "K", _7_, "Hover")
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
  return vim.api.nvim_create_autocmd({"LspAttach"}, {callback = _5_, desc = "Lsp actions", group = augid_4_, pattern = "*"})
end
local function _9_()
  return (require("luasnip.loaders.from_vscode")).lazy_load()
end
local function _10_()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  local lspkind = require("lspkind")
  local function _11_(args)
    return (require("luasnip")).lsp_expand(args.body)
  end
  local function _12_(entry, vim_item)
    local cmp_format = lspkind.cmp_format({mode = "symbol_text", symbol_map = {Codeium = "\239\131\144"}})
    local kind = cmp_format(entry, vim_item)
    local strings = vim.split(kind.kind, "%s", {trimempty = true})
    kind.kind = (" " .. (strings[1] or "") .. " ")
    kind.menu = ("    (" .. (strings[2] or "") .. ")")
    return kind
  end
  local function _13_(fallback)
    if cmp.visible() then
      return cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
      return luasnip.expand_or_jump()
    else
      return fallback()
    end
  end
  local function _15_(fallback)
    if cmp.visible() then
      return cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      return luasnip.jump(-1)
    else
      return fallback()
    end
  end
  return cmp.setup({snippet = {expand = _11_}, window = {completion = {winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None", col_offset = -3, side_padding = 0}}, formatting = {fields = {"kind", "abbr", "menu"}, format = _12_}, mapping = cmp.mapping.preset.insert({["<Tab>"] = cmp.mapping(_13_, {"i", "s"}), ["<S-Tab>"] = cmp.mapping(_15_, {"i", "s"}), ["<C-b>"] = cmp.mapping.scroll_docs(-4), ["<C-f>"] = cmp.mapping.scroll_docs(4), ["<C-Space>"] = cmp.mapping.complete(), ["<C-e>"] = cmp.mapping.abort(), ["<CR>"] = cmp.mapping.confirm({select = true})}), sources = cmp.config.sources({{name = "nvim_lsp"}, {name = "luasnip"}, {name = "path"}, {name = "latex_symbols", option = {strategy = 0}}}, {{name = "buffer"}, {name = "emoji"}, {name = "cmp_yanky", option = {onlyCurrentFiletype = true}}}), experimental = {ghost_text = {hl_group = "CmpGhostText"}}})
end
return {{"williamboman/mason.nvim", cmd = "Mason", build = "MasonUpdate", opts = {}}, {"williamboman/mason-lspconfig.nvim", event = {"BufReadPre", "BufNewFile"}, config = _1_}, {"neovim/nvim-lspconfig", event = {"BufReadPre", "BufNewFile"}, cmd = {"LspInfo", "LspInstall", "LspUninstall"}, config = _3_}, {"hrsh7th/nvim-cmp", event = "InsertEnter", dependencies = {"hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-emoji", "kdheepak/cmp-latex-symbols", "chrisgrieser/cmp_yanky", {"L3MON4D3/LuaSnip", build = "make install_jsregexp", dependencies = {{"rafamadriz/friendly-snippets", config = _9_}}}, "saadparwaiz1/cmp_luasnip", "onsails/lspkind.nvim"}, config = _10_}}
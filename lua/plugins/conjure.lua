-- :fennel:1704310364
local function _1_()
  local cmp = require("cmp")
  local config = cmp.get_config()
  table.insert(config.sources, {name = "buffer", option = {sources = {name = "conjure"}}})
  return cmp.setup(config)
end
local function _2_()
  require("conjure.main").main()
  return require("conjure.mapping")["on-filetype"]()
end
local function _3_()
  vim.g["conjure#debug"] = true
  return nil
end
return {"Olical/conjure", ft = {"clojure", "fennel"}, dependencies = {{"PaterJason/cmp-conjure", config = _1_}}, config = _2_, init = _3_}
-- :fennel:1722617692
local lazy = require("lazy")
do end (vim.g)["mapleader"] = " "
vim.g["maplocalleader"] = "\\"
lazy.setup("plugins", {performance = {cache = {enabled = true}, rtp = {disabled_plugins = {"gzip", "tarPlugin", "tohtml", "netrwPlugin", "tutor", "zipPlugin"}}, reset_packpath = false}})
return require("config")
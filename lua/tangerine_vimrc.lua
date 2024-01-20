-- :fennel:1705787927
local lazy = require("lazy")
do end (vim.g)["mapleader"] = " "
vim.g["maplocalleader"] = "\\"
lazy.setup("plugins", {performance = {reset_packpath = false}})
return require("config")
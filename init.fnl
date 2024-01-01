(local lazy (require :lazy))
(import-macros {: g!} :hibiscus.vim)

(g! :mapleader " ")
(g! :maplocalleader "\\")

(lazy.setup :plugins {:performance {:reset_packpath false}})

(require :config)

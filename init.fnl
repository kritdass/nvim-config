(local lazy (require :lazy))
(import-macros {: g!} :hibiscus.vim)

(g! :mapleader " ")
(g! :maplocalleader "\\")

(lazy.setup :plugins
            {:performance {:reset_packpath false
                           :cache {:enabled true}
                           :rtp {:disabled_plugins [:gzip
                                                    :tarPlugin
                                                    :tohtml
                                                    :netrwPlugin
                                                    :tutor
                                                    :zipPlugin]}}})

(require :config)

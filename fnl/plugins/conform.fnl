(import-macros {: plug!} :macros)

(plug! :stevearc/conform.nvim
       {:event [:BufReadPost :BufNewFile]
        :opts {:formatters_by_ft {:fish [:fish_indent]
                                  :fennel [:fnlfmt]
                                  :haskell [:fourmolu]
                                  :markdown [:mdformat]
                                  :clojure [:cljstyle]
                                  :typescriptreact [[:prettierd :prettier]]
                                  :javascriptreact [[:prettierd :prettier]]
                                  :_ [:trim_whitespace :trim_newlines]}
               :format_on_save {:lsp_fallback true :timeout_ms 500}}})

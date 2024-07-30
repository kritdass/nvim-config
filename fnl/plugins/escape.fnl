(import-macros {: plug!} :macros)

(plug! :max397574/better-escape.nvim
       {:event :InsertEnter
        :opts {:mappings {:i {:j {:k :<Esc>} :k {:j :<Esc>}}
                          :c {:j {:k :<Esc>} :k {:j :<Esc>}}
                          :t {:j {:k :<Esc>} :k {:j :<Esc>}}
                          :v {:j {:k :<Esc>} :k {:j :<Esc>}}
                          :s {:j {:k :<Esc>} :k {:j :<Esc>}}}}})

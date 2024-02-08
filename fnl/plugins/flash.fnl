(import-macros {: plug!} :macros)

(plug! :folke/flash.nvim
       {:event :VeryLazy
        :opts {}
        :keys (fn []
                (let [flash (require :flash)]
                  [{1 :s :mode [:n :o :x] 2 flash.jump :desc :Flash}
                   {1 :S
                    :mode [:n :o :x]
                    2 flash.treesitter
                    :desc "Flash Treesitter"}
                   {1 :<C-e>
                    :mode [:c]
                    2 flash.toggle
                    :desc "Toggle Flash search"}]))})

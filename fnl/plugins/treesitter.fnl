(import-macros {: plug! : require!} :macros)

(plug! :nvim-treesitter/nvim-treesitter
       {:event [:BufRead :BufNewFile]
        :build ":TSUpdate"
        :version false
        :init (fn [plugin]
                ((require! :lazy.core.loader :add_to_rtp) plugin)
                (require :nvim-treesitter.query_predicates))
        :opts {:highlight {:enable true}
               :indent {:enable true}
               :sync_install false
               :auto_install true
               :ensure_installed [:c :lua :vim :vimdoc :query]}
        :config (fn [_ opts] ((require! :nvim-treesitter.configs :setup) opts))})

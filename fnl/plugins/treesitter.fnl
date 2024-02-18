(import-macros {: plug! : require!} :macros)

(local textobj-opts
       {:textobjects {:select {:enable true
                               :lookahead true
                               :keymaps {:af {:query "@function.outer"
                                              :desc "a function"}
                                         :if {:query "@function.inner"
                                              :desc "inner function"}
                                         :ac {:query "@class.outer"
                                              :desc "a class"}
                                         :ic {:query "@class.inner"
                                              :desc "inner class"}}}}})

(plug! :nvim-treesitter/nvim-treesitter
       {:event :VeryLazy
        :build ":TSUpdate"
        :dependencies [:nvim-treesitter/nvim-treesitter-context
                       (plug! :nvim-treesitter/nvim-treesitter-textobjects
                              {:config (fn []
                                         ((require! :nvim-treesitter.configs
                                                    :setup) textobj-opts))})]
        :version false
        :opts {:highlight {:enable true}
               :indent {:enable true}
               :sync_install false
               :auto_install true
               :ensure_installed [:c :lua :vim :vimdoc :query]}
        :config (fn [_ opts] ((require! :nvim-treesitter.configs :setup) opts))})

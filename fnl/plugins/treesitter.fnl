(import-macros {: plug! : g! : require!} :macros)

(plug! :nvim-treesitter/nvim-treesitter
       {:branch :master
        :build ":TSUpdate"
        :version false
        :event [:BufReadPost :BufNewFile :VeryLazy]
        :dependencies [:nvim-treesitter/nvim-treesitter-context
                       (plug! :nvim-treesitter/nvim-treesitter-textobjects
                              {:branch :main
                               :init (fn [] (g! :no_plugin_maps true))})]
        :opts {:highlight {:enable true}
               :indent {:enable true}
               :sync_install false
               :auto_install true
               :ensure_installed [:c :lua :vim :vimdoc :query :fennel]}
        :config (fn [_ opts] ((require! :nvim-treesitter.configs :setup) opts))})

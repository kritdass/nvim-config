(import-macros {: plug!} :macros)

(plug! :petertriho/nvim-scrollbar
       {:event :VeryLazy
        :opts {:excluded_filetypes [:help
                                    :dashboard
                                    :neo-tree
                                    :Trouble
                                    :lazy
                                    :mason
                                    :toggleterm]}})

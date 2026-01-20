(import-macros {: plug!} :macros)

(plug! :petertriho/nvim-scrollbar
       {:event :VeryLazy
        :opts {:excluded_filetypes [:help
                                    :snacks_dashboard
                                    :snacks_picker_list
                                    :snacks_terminal
                                    :Trouble
                                    :lazy
                                    :mason]}})

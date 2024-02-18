(import-macros {: plug!} :macros)

(plug! :lukas-reineke/indent-blankline.nvim
       {:main :ibl
        :event :BufRead
        :dependencies [(plug! :echasnovski/mini.indentscope
                              {:opts {:symbol "│"
                                      :options {:try_as_border true}}})]
        :opts {:indent {:char "│"} :scope {:enabled false}}})

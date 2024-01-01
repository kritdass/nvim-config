(import-macros {: plug!} :macros)

(plug! :lukas-reineke/indent-blankline.nvim
       {:main :ibl
        :event :BufRead
        :opts {:indent {:char "▏"}
               :scope {:show_start false :show_end false}}})

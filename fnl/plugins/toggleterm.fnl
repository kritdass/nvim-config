(import-macros {: plug!} :macros)

(plug! :akinsho/toggleterm.nvim
       {:cmd [:ToggleTerm :ToggleTermToggleAll]
        :tag :v2.9.0
        :opts {:shade_terminals false}})

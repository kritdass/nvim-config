(import-macros {: plug!} :macros)

(plug! :akinsho/bufferline.nvim
       {:event :VeryLazy :opts {:options {:always_show_bufferline false}}})

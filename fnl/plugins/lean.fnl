(import-macros {: plug!} :macros)

(plug! :Julian/lean.nvim
       {:event ["BufReadPre *.lean" "BufNewFile *.lean"]
        :dependencies [:neovim/nvim-lspconfig
                       :nvim-lua/plenary.nvim
                       :hrsh7th/nvim-cmp
                       :nvim-telescope/telescope.nvim]
        :opts {:mappings true :infoview {:orientation :horizontal}}})

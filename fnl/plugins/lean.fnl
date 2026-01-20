(import-macros {: plug!} :macros)

(plug! :Julian/lean.nvim
       {:event ["BufReadPre *.lean" "BufNewFile *.lean"]
        :dependencies [:neovim/nvim-lspconfig
                       :nvim-lua/plenary.nvim
                       :saghen/blink.cmp]
        :opts {:mappings true :infoview {:orientation :horizontal}}})

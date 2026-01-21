(import-macros {: plug! : require!} :macros)

[(plug! :mason-org/mason.nvim {:cmd :Mason :opts {}})
 (plug! :neovim/nvim-lspconfig
        {:event [:BufReadPre :BufNewFile]
         :opts {}
         :config (fn []
                   (let [blink-capabilities (. (require :blink.cmp)
                                               :get_lsp_capabilities)]
                     (_G.vim.lsp.config "*"
                                        {:capabilities (blink-capabilities {:textDocument {:foldingRange {:dynamicRegistration false
                                                                                                          :lineFoldingOnly true}}})})))
         :dependencies [(plug! :mason-org/mason-lspconfig.nvim {:opts {}})
                        :mason-org/mason-lspconfig.nvim]
         :keys (let [map (fn [mode key action desc]
                           {1 key 2 action mode :mode : desc})]
                 (map :n :K
                      (fn []
                        (when (not ((require! :ufo :peekFoldedLinesUnderCursor)))
                          (_G.vim.lsp.buf.hover))) :Hover)
                 (map :n :gd "<cmd>lua vim.lsp.buf.definition()<cr>"
                      "Goto definition")
                 (map :n :gD "<cmd>lua vim.lsp.buf.declaration()<cr>"
                      "Goto declaration")
                 (map :n :gi "<cmd>lua vim.lsp.buf.implementation()<cr>"
                      "Goto implementation")
                 (map :n :go "<cmd>lua vim.lsp.buf.type_definition()<cr>"
                      "Goto type definition")
                 (map :n :gr "<cmd>lua vim.lsp.buf.references()<cr>"
                      "Goto references")
                 (map :n :<leader>cr "<cmd>lua vim.lsp.buf.rename()<cr>"
                      :Rename)
                 (map :n :<leader>cf
                      "<cmd>lua vim.lsp.buf.format({async = true})<cr>" :Format)
                 (map :n :<leader>ca "<cmd>lua vim.lsp.buf.code_action()<cr>"
                      "Code actions")
                 (map :n :<leader>ct
                      "<cmd>lua vim.lsp.buf.type_definition()<cr>"
                      "Type definition"))})
 (plug! :saghen/blink.cmp
        {:event [:BufReadPre :BufNewFile]
         :version :1.*
         :dependencies [:rafamadriz/friendly-snippets]
         :opts {:keymap {:preset :default
                         :<Tab> [:select_next :fallback]
                         :<S-Tab> [:select_next :fallback]
                         :<CR> [:accept :fallback]
                         :<C-space> [:show_documentation :hide_documentation]}
                :appearance {:nerd_font_variant :normal}
                :completion {:documentation {:auto_show true}
                             :ghost_text {:enabled true}}
                :sources {:default [:lsp :path :snippets :buffer]}}
         :opts_extend [:sources.default]})]

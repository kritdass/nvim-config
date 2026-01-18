(import-macros {: plug! : require! : vim!} :macros)
(import-macros {: augroup!} :hibiscus.vim)

[(plug! :williamboman/mason.nvim {:build ":MasonUpdate" :opts {}})
 (plug! :williamboman/mason-lspconfig.nvim
        {:event [:BufReadPre :BufNewFile]
         :config (fn []
                   ((require! :mason-lspconfig :setup) {:automatic_installation true})
                   ((require! :mason-lspconfig :setup_handlers) [(fn [server]
                                                                   (let [lspconfig (require :lspconfig)
                                                                         capabilities ((require! :blink.cmp
                                                                                                 :get_lsp_capabilities) ((vim! :lsp.protocol.make_client_capabilities)))
                                                                         root_dir (fn [filename
                                                                                       bufnr]
                                                                                    (or ((vim! :fs.root) bufnr
                                                                                                         [:.git])
                                                                                        ((vim! :fn.expand) "%:p:h")))]
                                                                     (set capabilities.textDocument.foldingRange
                                                                          {:dynamicRegistration false
                                                                           :lineFoldingOnly true})
                                                                     ((. lspconfig
                                                                         server
                                                                         :setup) {: capabilities
                                                                                  : root_dir})))]))})
 (plug! :neovim/nvim-lspconfig
        {:event [:BufReadPre :BufNewFile]
         :cmd [:LspInfo :LspInstall :LspUninstall]
         :config (fn []
                   (augroup! :lsp
                             [[:LspAttach :desc "Lsp actions"]
                              "*"
                              (fn [event]
                                (let [map (fn [mode lhs rhs desc]
                                            ((vim! :keymap.set) mode lhs rhs
                                                                {:buffer event.buf
                                                                 : desc}))]
                                  (map :n :K
                                       (fn []
                                         (when (not ((require! :ufo
                                                               :peekFoldedLinesUnderCursor)))
                                           ((vim! :lsp.buf.hover))))
                                       :Hover)
                                  (map :n :gd
                                       "<cmd>lua vim.lsp.buf.definition()<cr>"
                                       "Goto definition")
                                  (map :n :gD
                                       "<cmd>lua vim.lsp.buf.declaration()<cr>"
                                       "Goto declaration")
                                  (map :n :gi
                                       "<cmd>lua vim.lsp.buf.implementation()<cr>"
                                       "Goto implementation")
                                  (map :n :go
                                       "<cmd>lua vim.lsp.buf.type_definition()<cr>"
                                       "Goto type definition")
                                  (map :n :gr
                                       "<cmd>lua vim.lsp.buf.references()<cr>"
                                       "Goto references")
                                  (map :n :<leader>cr
                                       "<cmd>lua vim.lsp.buf.rename()<cr>"
                                       :Rename)
                                  (map :n :<leader>cf
                                       "<cmd>lua vim.lsp.buf.format({async = true})<cr>"
                                       :Format)
                                  (map :n :<leader>ca
                                       "<cmd>lua vim.lsp.buf.code_action()<cr>"
                                       "Code actions")
                                  (map :n :<leader>ct
                                       "<cmd>lua vim.lsp.buf.type_definition()<cr>"
                                       "Type definition")))]))})
 (plug! :saghen/blink.cmp
        {:version :1.*
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

(import-macros {: plug! : require! : vim!} :macros)
(import-macros {: augroup!} :hibiscus.vim)

[(plug! :williamboman/mason.nvim {:cmd :Mason :build :MasonUpdate :opts {}})
 (plug! :williamboman/mason-lspconfig.nvim
        {:event [:BufReadPre :BufNewFile]
         :config (fn []
                   ((require! :mason-lspconfig :setup) {:automatic_installation true})
                   ((require! :mason-lspconfig :setup_handlers) [(fn [server]
                                                                   (let [lspconfig (require :lspconfig)
                                                                         capabilities ((require! :cmp_nvim_lsp
                                                                                                 :default_capabilities) ((vim! :lsp.protocol.make_client_capabilities)))]
                                                                     (set capabilities.textDocument.foldingRange
                                                                          {:dynamicRegistration false
                                                                           :lineFoldingOnly true})
                                                                     ((. lspconfig
                                                                         server
                                                                         :setup) {: capabilities})))]))})
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
 (plug! :hrsh7th/nvim-cmp
        {:event :InsertEnter
         :dependencies [:hrsh7th/cmp-nvim-lsp
                        :hrsh7th/cmp-buffer
                        :hrsh7th/cmp-path
                        :hrsh7th/cmp-emoji
                        :kdheepak/cmp-latex-symbols
                        :chrisgrieser/cmp_yanky
                        (plug! :L3MON4D3/LuaSnip
                               {:build "make install_jsregexp"
                                :dependencies [(plug! :rafamadriz/friendly-snippets
                                                      {:config (fn []
                                                                 ((require! :luasnip.loaders.from_vscode
                                                                            :lazy_load)))})]})
                        :saadparwaiz1/cmp_luasnip
                        :onsails/lspkind.nvim]
         :config (fn []
                   (let [cmp (require :cmp)
                         luasnip (require :luasnip)
                         lspkind (require :lspkind)]
                     (cmp.setup {:snippet {:expand (fn [args]
                                                     ((require! :luasnip
                                                                :lsp_expand) args.body))}
                                 :window {:completion {:winhighlight "Normal:Pmenu,FloatBorder:Pmenu,Search:None"
                                                       :col_offset -3
                                                       :side_padding 0}}
                                 :formatting {:fields [:kind :abbr :menu]
                                              :format (fn [entry vim-item]
                                                        (let [cmp-format (lspkind.cmp_format {:mode :symbol_text
                                                                                              :symbol_map {:Codeium ""}})
                                                              kind (cmp-format entry
                                                                               vim-item)
                                                              strings ((vim! :split) kind.kind
                                                                                     "%s"
                                                                                     {:trimempty true})]
                                                          (set kind.kind
                                                               (.. " "
                                                                   (or (. strings
                                                                          1)
                                                                       "")
                                                                   " "))
                                                          (set kind.menu
                                                               (.. "    ("
                                                                   (or (. strings
                                                                          2)
                                                                       "")
                                                                   ")"))
                                                          kind))}
                                 :mapping (cmp.mapping.preset.insert {:<Tab> (cmp.mapping (fn [fallback]
                                                                                            (if (cmp.visible)
                                                                                                (cmp.select_next_item)
                                                                                                (luasnip.expand_or_jumpable)
                                                                                                (luasnip.expand_or_jump)
                                                                                                (fallback)))
                                                                                          [:i
                                                                                           :s])
                                                                      :<S-Tab> (cmp.mapping (fn [fallback]
                                                                                              (if (cmp.visible)
                                                                                                  (cmp.select_prev_item)
                                                                                                  (luasnip.jumpable -1)
                                                                                                  (luasnip.jump -1)
                                                                                                  (fallback)))
                                                                                            [:i
                                                                                             :s])
                                                                      :<C-b> (cmp.mapping.scroll_docs -4)
                                                                      :<C-f> (cmp.mapping.scroll_docs 4)
                                                                      :<C-Space> (cmp.mapping.complete)
                                                                      :<C-e> (cmp.mapping.abort)
                                                                      :<CR> (cmp.mapping.confirm {:select true})})
                                 :sources (cmp.config.sources [{:name :nvim_lsp}
                                                               {:name :luasnip}
                                                               {:name :path}
                                                               {:name :latex_symbols
                                                                :option {:strategy 0}}]
                                                              [{:name :buffer}
                                                               {:name :emoji}
                                                               {:name :cmp_yanky
                                                                :option {:onlyCurrentFiletype true}}])})))})]

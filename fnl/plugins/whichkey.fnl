(import-macros {: plug!} :macros)

(plug! :folke/which-key.nvim
       {:event :VeryLazy
        :opts {:defaults {:<leader>t {:name :+terminal}
                          :<leader>x {:name :+trouble}
                          :<leader>h {:name :+git}
                          :<leader>b {:name :+buffer}
                          :<leader>f {:name :+find}
                          :<leader>q {:name :+quit}
                          :<leader>u {:name :+toggle}
                          :<leader><tab> {:name :+tab}
                          :<leader>w {:name :+window}
                          :<leader>c {:name :+lsp}
                          :z {:name :+fold}
                          :g {:name :+goto}
                          "]" {:name :+next}
                          "[" {:name :+prev}}}
        :config (fn [_ opts]
                  (let [wk (require :which-key)] (wk.setup opts)
                    (wk.register opts.defaults)))})

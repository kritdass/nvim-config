(import-macros {: plug!} :macros)

(plug! :folke/which-key.nvim
       {:event :VeryLazy
        :opts {:spec [{1 :<leader>t :group :terminal}
                      {1 :<leader>x :group :trouble}
                      {1 :<leader>h :group :git}
                      {1 :<leader>b :group :buffer}
                      {1 :<leader>f :group :find}
                      {1 :<leader>q :group :quit}
                      {1 :<leader>u :group :toggle}
                      {1 :<leader><tab> :group :tab}
                      {1 :<leader>w :group :window}
                      {1 :<leader>c :group :lsp}
                      {1 :z :group :fold}
                      {1 :g :group :goto}
                      {1 "]" :group :next}
                      {1 "[" :group :prev}]}})

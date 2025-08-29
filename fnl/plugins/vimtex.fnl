(import-macros {: plug!} :macros)
(import-macros {: g!} :hibiscus.vim)

(plug! :lervag/vimtex
       {:lazy false
        :init (fn [] (g! :vimtex_compiler_method :latexmk)
                (g! :vimtex_view_general_viewer :sumatra)
                (g! :vimtex_view_general_options "-reuse-instance @pdf"))})

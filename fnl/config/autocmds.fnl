(import-macros {: augroup! : setlocal!} :macros)

(augroup! :highlight-yank
          [[:TextYankPost :desc "Highlight selection on yank"]
           "*"
           (fn [] (_G.vim.highlight.on_yank))])

(augroup! :wrap-spell [[:FileType]
                       [:markdown :tex :text :trouble :typst]
                       (fn [] (setlocal! :wrap)
                         (setlocal! :spell))])

(augroup! :typst-preview [[:BufRead :BufNewFile] :*.typ :TypstPreview]
          [[:BufWipeout] :*.typ :TypstPreviewStop])

(augroup! :disable-typr-completion
          [[:FileType] [:typr] (fn [] (tset _G.vim.b :completion false))])

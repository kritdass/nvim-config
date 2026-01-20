(import-macros {: vim! : require! : augroup! : setlocal!} :macros)

(augroup! :highlight-yank
          [[:TextYankPost :desc "Highlight selection on yank"]
           "*"
           (fn [] ((vim! :highlight.on_yank)))])

(augroup! :wrap-spell [[:FileType]
                       [:markdown :tex :text :trouble :typst]
                       (fn [] (setlocal! :wrap)
                         (setlocal! :spell))])

(augroup! :typst-preview [[:BufRead :BufNewFile] :*.typ :TypstPreview]
          [[:BufWipeout] :*.typ :TypstPreviewStop])

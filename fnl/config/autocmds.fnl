(import-macros {: augroup! : setlocal!} :hibiscus.vim)
(import-macros {: vim!} :macros)

(augroup! :highlight-yank
          [[:TextYankPost :desc "Highlight selection on yank"]
           "*"
           (fn [] ((vim! :highlight.on_yank)))])

(augroup! :wrap-spell [[:FileType]
                       [:markdown]
                       (fn [] (setlocal! :wrap)
                         (setlocal! :spell))])

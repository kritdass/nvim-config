(import-macros {: augroup! : setlocal!} :hibiscus.vim)
(import-macros {: vim! : require!} :macros)

(augroup! :highlight-yank
          [[:TextYankPost :desc "Highlight selection on yank"]
           "*"
           (fn [] ((vim! :highlight.on_yank)))])

(augroup! :wrap-spell [[:FileType]
                       [:markdown :tex :text :trouble]
                       (fn [] (setlocal! :wrap)
                         (setlocal! :spell))])

((require! :colorizer :setup))

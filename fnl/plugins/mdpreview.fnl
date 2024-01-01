(import-macros {: plug! : vim!} :macros)

(plug! :iamcco/markdown-preview.nvim
       {:cmd [:MarkdownPreview]
        :ft [:markdown]
        :build (fn []
                 ((. (vim! :fn) "mkdp#util#install")))})

(import-macros {: plug! : vim! : require!} :macros)

(fn handler [virt-text lnum end-lnum width truncate]
  (var new-virt-text {})
  (var suffix (string.format " 󰁂 %d " (- end-lnum lnum)))
  (var suf-width ((vim! :fn.strdisplaywidth) suffix))
  (var target-width (- width suf-width))
  (var cur-width 0)
  (each [_ chunk (ipairs virt-text)]
    (var chunk-text (. chunk 1))
    (var chunk-width ((vim! :fn.strdisplaywidth) chunk-text))
    (if (> target-width (+ cur-width chunk-width))
        (table.insert new-virt-text chunk)
        (do
          (set chunk-text (truncate chunk-text (- target-width cur-width)))
          (table.insert new-virt-text [chunk-text (. chunk 2)])
          (set chunk-width ((vim! :fn.strdisplaywidth) chunk-text))
          (when (< (+ cur-width chunk-width) target-width)
            (set suffix
                 (.. suffix
                     (string.rep " " (- target-width cur-width chunk-width)))))
          (lua :break)))
    (set cur-width (+ cur-width chunk-width)))
  (table.insert new-virt-text [suffix :MoreMsg])
  new-virt-text)

(local ft-exclude [:help :alpha :neo-tree :Trouble :lazy :mason :toggleterm])

(plug! :kevinhwang91/nvim-ufo
       {:event [:BufReadPre :BufNewFile]
        :dependencies [:kevinhwang91/promise-async
                       (plug! :luukvbaal/statuscol.nvim
                              {:config (fn []
                                         (let [builtin (require :statuscol.builtin)]
                                           ((require! :statuscol :setup) {:ft_ignore ft-exclude
                                                                          :relculright true
                                                                          :segments [{:sign {:name [:Diagnostic]
                                                                                             :maxwidth 1
                                                                                             :auto true}
                                                                                      :click "v:lua.ScFa"}
                                                                                     {:sign {:namespace [:gitsigns]
                                                                                             :maxwidth 1
                                                                                             :auto true}
                                                                                      :click "v:lua:ScSa"}
                                                                                     {:text [builtin.foldfunc
                                                                                             "  "]
                                                                                      :click "v:lua.ScFa"}
                                                                                     {:sign {:maxwidth 1
                                                                                             :auto true}
                                                                                      :text [builtin.lnumfunc
                                                                                             "  "]
                                                                                      :click "v:lua.ScLa"}]})))})]
        :opts {:fold_virt_text_handler handler
               :provider_selector (fn [_ ft _]
                                    (let [nofold [:markdown
                                                  :sh
                                                  :css
                                                  :html
                                                  :python
                                                  :fennel]]
                                      (if ((vim! :tbl_contains) nofold ft)
                                          [:treesitter :indent]
                                          [:lsp :indent])))
               :filetype_exclude ft-exclude}})

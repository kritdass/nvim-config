(import-macros {: plug!} :macros)

(plug! :gbprod/yanky.nvim
       {:dependencies [:kkharji/sqlite.lua]
        :opts {:ring {:storage :sqlite}}
        :keys [{1 :y 2 "<Plug>(YankyYank)" :desc "Yank text" :mode [:n :x]}
               {1 :p
                2 "<Plug>(YankyPutAfter)"
                :desc "Put yanked text after cursor"
                :mode [:n :x]}
               {1 :P
                2 "<Plug>(YankyPutBefore)"
                :desc "Put yanked text before cursor"
                :mode [:n :x]}
               {1 :gp
                2 "<Plug>(YankyGPutAfter)"
                :desc "Put yanked text after selection"
                :mode [:n :x]}
               {1 :gP
                2 "<Plug>(YankyGPutBefore)"
                :desc "Put yanked text before selection"
                :mode [:n :x]}
               {1 "[y"
                2 "<Plug>(YankyCycleForward)"
                :desc "Cycle forward through yank history"}
               {1 "]y"
                2 "<Plug>(YankyCycleBackward)"
                :desc "Cycle backward through yank history"}
               {1 "]p"
                2 "<Plug>(YankyPutIndentAfterLinewise)"
                :desc "Put indented after cursor (linewise)"}
               {1 "[p"
                2 "<Plug>(YankyPutIndentBeforeLinewise)"
                :desc "Put indented before cursor (linewise)"}
               {1 "]P"
                2 "<Plug>(YankyPutIndentAfterLinewise)"
                :desc "Put indented after cursor (linewise)"}
               {1 "[P"
                2 "<Plug>(YankyPutIndentBeforeLinewise)"
                :desc "Put indented before cursor (linewise)"}
               {1 :>p
                2 "<Plug>(YankyPutIndentAfterShiftRight)"
                :desc "Put and indent right"}
               {1 :<p
                2 "<Plug>(YankyPutIndentAfterShiftLeft)"
                :desc "Put and indent left"}
               {1 :>P
                2 "<Plug>(YankyPutIndentBeforeShiftRight)"
                :desc "Put before and indent right"}
               {1 :<P
                2 "<Plug>(YankyPutIndentBeforeShiftLeft)"
                :desc "Put before and indent left"}
               {1 :=p
                2 "<Plug>(YankyPutAfterFilter)"
                :desc "Put after applying a filter"}
               {1 :=P
                2 "<Plug>(YankyPutBeforeFilter)"
                :desc "Put before applying a filter"}]})

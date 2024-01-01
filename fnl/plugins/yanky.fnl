(import-macros {: plug!} :macros)

(plug! :gbprod/yanky.nvim
       {:dependencies [:kkharji/sqlite.lua] :opts {:ring {:storage :sqlite}}})

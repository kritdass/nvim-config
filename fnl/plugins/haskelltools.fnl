(import-macros {: plug!} :macros)

(plug! :mrcjkb/haskell-tools.nvim
       {:version :^3 :ft [:haskell :lhaskell :cabal :cabalproject]})

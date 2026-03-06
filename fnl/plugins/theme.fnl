(import-macros {: plug!} :macros)

(plug! :RRethy/base16-nvim
       {:priority 1000
        :lazy false
        :config (fn []
                  ((. (require :matugen) :setup)))})

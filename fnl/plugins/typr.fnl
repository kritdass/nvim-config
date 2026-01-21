(import-macros {: plug!} :macros)

(plug! :nvzone/typr {:dependencies [:nvzone/volt]
                     :opts {}
                     :cmd [:Typr :TyprStats]})

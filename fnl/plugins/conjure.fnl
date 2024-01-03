(import-macros {: plug! : require!} :macros)
(import-macros {: g!} :hibiscus.vim)

(plug! :Olical/conjure
       {:ft [:clojure :fennel]
        :dependencies [(plug! :PaterJason/cmp-conjure
                              {:config (fn []
                                         (let [cmp (require :cmp)
                                               config (cmp.get_config)]
                                           (table.insert config.sources
                                                         {:name :buffer
                                                          :option {:sources {:name :conjure}}})
                                           (cmp.setup config)))})]
        :config (fn []
                  ((require! :conjure.main :main))
                  ((. (require! :conjure.mapping) :on-filetype)))
        :init (fn []
                (g! "conjure#debug" true))})

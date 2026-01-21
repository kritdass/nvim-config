(import-macros {: plug! : map!} :macros)

(plug! :jake-stewart/multicursor.nvim
       {:branch :1.0
        :event [:BufReadPre :BufNewFile :VeryLazy]
        :config (fn []
                  (let [mc (require :multicursor-nvim)]
                    (mc.setup)
                    (map! [:nx] :<localleader>n (fn [] (mc.matchAddCursor 1))
                          "Add cursor after")
                    (map! [:nx] :<localleader>s (fn [] (mc.matchSkipCursor 1))
                          "Skip cursor after")
                    (map! [:nx] :<localleader>N (fn [] (mc.matchAddCursor -1))
                          "Add cursor before")
                    (map! [:nx] :<localleader>S (fn [] (mc.matchSkipCursor -1))
                          "Skip cursor before")
                    (map! [:nx] :<localleader>q mc.toggleCursor
                          "Toggle cursors")
                    (mc.addKeymapLayer (fn [layer-set]
                                         (layer-set [:n :x] :<localleader>x
                                                    mc.deleteCursor
                                                    {:desc "Delete cursor"})
                                         (layer-set :n :<esc>
                                                    (fn []
                                                      (if (not (mc.cursorsEnabled))
                                                          (mc.enableCursors)
                                                          (mc.clearCursors))))))))})

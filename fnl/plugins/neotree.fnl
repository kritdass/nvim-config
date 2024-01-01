(import-macros {: plug! : vim!} :macros)

(plug! :nvim-neo-tree/neo-tree.nvim
       {:cmd :Neotree
        :branch :v3.x
        :dependencies [:nvim-lua/plenary.nvim
                       :nvim-tree/nvim-web-devicons
                       :MunifTanjim/nui.nvim]
        :init (fn []
                (when (= ((vim! :fn.argc) -1) 1)
                  (let [stat ((vim! :loop.fs_stat) ((vim! :fn.argv) 0))]
                    (when (and stat (= stat.type :directory))
                      (require :neo-tree)))))
        :opts {:close_if_last_window true
               :default_component_configs {:diagnostics {:symbols {:hint "󰌵"
                                                                   :info "󰙎"
                                                                   :warn ""
                                                                   :error ""}}}
               :window {:width 30 :mappings {:<space> :none}}
               :filesystem {:follow_current_file {:enabled true}
                            :hijack_netrw_behavior :open_current
                            :use_libuv_file_watcher true}}})

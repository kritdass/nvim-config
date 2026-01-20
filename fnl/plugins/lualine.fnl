(import-macros {: plug!} :macros)
(local colors (require :config.colors))

(local bubbles {:normal {:a {:fg colors.bg :bg colors.green}
                         :b {:fg colors.fg :bg colors.gray}
                         :c {:fg colors.fg :bg colors.gray2}}
                :insert {:a {:fg colors.bg :bg colors.blue}}
                :visual {:a {:fg colors.bg :bg colors.yellow}}
                :replace {:a {:fg colors.bg :bg colors.red}}
                :command {:a {:fg colors.bg :bg colors.purple}}
                :terminal {:a {:fg colors.bg :bg colors.cyan}}
                :inactive {:a {:fg colors.fg :bg colors.bg}
                           :b {:fg colors.fg :bg colors.bg}
                           :c {:fg colors.bg :bg colors.bg}}})

(plug! :nvim-lualine/lualine.nvim
       {:event :VeryLazy
        :dependencies [(plug! :nvim-mini/mini.icons
                              {:init (fn []
                                       (fn package.preload.nvim-web-devicons []
                                         ((. (require :mini.icons)
                                             :mock_nvim_web_devicons))
                                         (. package :loaded :nvim-web-devicons)))})]
        :opts {:options {:theme bubbles
                         :component_separators "|"
                         :section_separators {:left "" :right ""}
                         :disabled_filetypes {:statusline [:snacks_dashboard]}}
               :sections {:lualine_a [{1 :mode
                                       :separator {:left ""}
                                       :padding {:right 2}}]
                          :lualine_b [:filename :branch]
                          :lualine_c []
                          :lualine_x []
                          :lualine_y [:filetype :progress]
                          :lualine_z [{1 :location
                                       :separator {:right ""}
                                       :padding {:left 2}}]}
               :inactive_sections {:lualine_a [:filename]
                                   :lualine_b []
                                   :lualine_c []
                                   :lualine_x []
                                   :lualine_y []
                                   :lualine_z [:location]}}})

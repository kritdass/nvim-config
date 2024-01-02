(import-macros {: plug!} :macros)

(plug! :nvim-neorg/neorg
       {:ft :norg
        :cmd :Neorg
        :build ":Neorg sync-parsers"
        :opts {:load {:core.defaults {}
                      :core.concealer {}
                      :core.dirman {:config {:workspaces {:notes "~/notes"}}}
                      :core.export {}
                      :core.ui.calendar {}
                      :core.completion {:config {:engine :nvim-cmp}}}}})

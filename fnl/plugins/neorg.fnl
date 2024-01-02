(import-macros {: plug!} :macros)

(plug! :nvim-neorg/neorg
       {:ft :norg
        :cmd :Neorg
        :dependencies [:nvim-neorg/neorg-telescope]
        :build ":Neorg sync-parsers"
        :opts {:load {:core.defaults {}
                      :core.concealer {}
                      :core.dirman {:config {:workspaces {:notes "~/notes"}}}
                      :core.export {}
                      :core.integrations.telescope {}
                      :core.ui.calendar {}
                      :core.completion {:config {:engine :nvim-cmp}}}}})

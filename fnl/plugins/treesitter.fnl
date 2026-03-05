(import-macros {: plug! : g! : augroup!} :macros)

(plug! :nvim-treesitter/nvim-treesitter
       {:lazy false 
        :build ":TSUpdate"
        :dependencies [:nvim-treesitter/nvim-treesitter-context
                       (plug! :nvim-treesitter/nvim-treesitter-textobjects
                              {:branch :main
                               :init (fn [] (g! :no_plugin_maps true))
                               :config (fn []
                                         (. (require  "nvim-treesitter-textobjects") :setup) 
                                         {:select {:lookahead true
                                                   :selection_modes {"@function.outer" :V
                                                                     "@class.outer" :V}}})})]
        :config (fn []
                  (let [ts (require :nvim-treesitter)]
                    (ts.install [:c :lua :vim :vimdoc :query :fennel :nix])

                    (augroup! :Treesitter
                      [[:FileType] "*"
                       (fn []
                         (let [ft _G.vim.bo.filetype
                               lang (_G.vim.treesitter.language.get_lang ft)]
                           (if lang
                               (when (pcall _G.vim.treesitter.start)
                                 (tset _G.vim.bo :indentexpr "v:lua.require'nvim-treesitter'.indentexpr()"))
                               (when (not= ft "")
                                 (pcall ts.install [ft])))))])))})

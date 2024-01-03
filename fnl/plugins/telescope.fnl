(import-macros {: plug! : require!} :macros)

(plug! :nvim-telescope/telescope.nvim
       {:cmd :Telescope
        :version false
        :dependencies [:nvim-lua/plenary.nvim
                       (plug! :nvim-telescope/telescope-fzf-native.nvim
                              {:build :make})
                       :debugloop/telescope-undo.nvim]
        :config (fn []
                  ((require! :telescope :load_extension) :fzf)
                  ((require! :telescope :load_extension) :undo)
                  ((require! :telescope :load_extension) :yank_history)
                  ((require! :telescope :load_extension) :ht)
                  ((require! :telescope :setup) {:defaults {:mappings {:i {:<esc> (require! :telescope.actions
                                                                                            :close)
                                                                           :<C-e> (require! :telescope.actions
                                                                                            :close)}}}}))})

(import-macros {: plug! : require! : vim!} :macros)
(import-macros {: augroup!} :hibiscus.vim)

(plug! :goolord/alpha-nvim
       {:event :VimEnter
        :init false
        :opts (fn []
                (let [dashboard (require :alpha.themes.dashboard)
                      logo [""
                            ""
                            ""
                            ""
                            "        ████ ██████           █████      ██                    "
                            "       ███████████             █████                            "
                            "       █████████ ███████████████████ ███   ███████████  "
                            "      █████████  ███    █████████████ █████ ██████████████  "
                            "     █████████ ██████████ █████████ █████ █████ ████ █████  "
                            "   ███████████ ███    ███ █████████ █████ █████ ████ █████ "
                            "  ██████  █████████████████████ ████ █████ █████ ████ ██████"
                            "                                                                       "]]
                  (set dashboard.section.header.val logo)
                  (set dashboard.section.buttons.val
                       [(dashboard.button :f "  Find file"
                                          "<cmd>Telescope find_files<cr>")
                        (dashboard.button :n "  New file"
                                          "<cmd>ene | startinsert<cr>")
                        (dashboard.button :r "  Recent files"
                                          "<cmd>Telescope oldfiles<cr>")
                        (dashboard.button :c "  Config"
                                          "<cmd>Telescope find_files cwd=$HOME/.config/nvim<cr>")
                        (dashboard.button :s "󰁯  Restore Session"
                                          "<cmd>lua require(\"persistence\").load()<cr>")
                        (dashboard.button :l "  Lazy" :<cmd>Lazy<cr>)
                        (dashboard.button :q "  Quit" :<cmd>qa<cr>)])
                  (each [_ button (ipairs dashboard.section.buttons.val)]
                    (set button.opts.hl :AlphaButtons)
                    (set button.opts.hl_schortcut :AlphaShortcuts))
                  (set dashboard.section.header.opts.hl :AlphaHeader)
                  (set dashboard.section.buttons.opts.hl :AlphaButtons)
                  (set dashboard.section.footer.opts.hl :AlphaFooter)
                  dashboard))
        :config (fn [_ dashboard]
                  ((require! :alpha :setup) dashboard.opts)
                  (augroup! :Stats
                            [[:User :once :desc "Load stats"]
                             :LazyVimStarted
                             (fn []
                               (let [stats ((require! :lazy :stats))
                                     ms (/ (math.floor (+ (* stats.startuptime
                                                             100)
                                                          0.5))
                                           100)]
                                 (set dashboard.section.footer.val
                                      (.. "⚡ Neovim loaded " stats.loaded "/"
                                          stats.count " plugins in " ms :ms))))])
                  (pcall (vim! :cmd.AlphaRedraw)))})

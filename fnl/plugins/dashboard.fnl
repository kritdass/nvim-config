(import-macros {: plug! : require!} :macros)

(plug! :nvimdev/dashboard-nvim {:event :VimEnter
                                :opts (fn []
                                        (var opts
                                             {:theme :doom
                                              :config {:header [""
                                                                ""
                                                                ""
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
                                                                "                                                                       "
                                                                ""
                                                                ""]
                                                       :center [{:icon " "
                                                                 :desc " Find file"
                                                                 :key :f
                                                                 :action "Telescope find_files"}
                                                                {:icon " "
                                                                 :desc " New file"
                                                                 :key :n
                                                                 :action "ene | startinsert"}
                                                                {:icon " "
                                                                 :desc " Recent files"
                                                                 :key :r
                                                                 :action "Telescope oldfiles"}
                                                                {:icon " "
                                                                 :desc " Config"
                                                                 :key :c
                                                                 :action "Telescope find_files cwd=$HOME/.config/nvim"}
                                                                {:icon "󰁯 "
                                                                 :desc " Restore session"
                                                                 :key :s
                                                                 :action "lua require('persistence').load()"}
                                                                {:icon " "
                                                                 :desc " Lazy"
                                                                 :key :l
                                                                 :action :Lazy}
                                                                {:icon " "
                                                                 :desc " Quit"
                                                                 :key :q
                                                                 :action :qa}]
                                                       :footer (fn []
                                                                 (let [stats ((require! :lazy
                                                                                        :stats))
                                                                       ms (/ (math.floor (+ (* stats.startuptime
                                                                                               100)
                                                                                            0.5))
                                                                             100)]
                                                                   [""
                                                                    (.. "⚡ Neovim loaded "
                                                                        stats.loaded
                                                                        "/"
                                                                        stats.count
                                                                        " plugins in "
                                                                        ms :ms)]))}})
                                        (each [_ button (ipairs opts.config.center)]
                                          (set button.desc
                                               (.. button.desc
                                                   (string.rep " "
                                                               (- 43
                                                                  (length button.desc)))))
                                          (set button.key_format "  %s"))
                                        opts)})

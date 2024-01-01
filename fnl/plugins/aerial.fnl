(import-macros {: plug! : vim!} :macros)

(plug! :stevearc/aerial.nvim {:opts {:on_attach (fn [buffer]
                                                  (let [map (fn [mode
                                                                 lhs
                                                                 rhs
                                                                 desc]
                                                              ((vim! :keymap.set) mode
                                                                                  lhs
                                                                                  rhs
                                                                                  {: buffer
                                                                                   : desc}))]
                                                    (map :n "}"
                                                         :<cmd>AerialNext<cr>
                                                         "Aerial next")
                                                    (map :n "{"
                                                         :<cmd>AerialPrev<cr>
                                                         "Aerial prev")))}
                              :cmd :AerialToggle})

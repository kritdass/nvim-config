(import-macros {: plug! : vim! : require!} :macros)

(plug! :lewis6991/gitsigns.nvim
       {:event [:BufReadPre :BufNewFile]
        :opts {:on_attach (fn [buffer]
                            ((require! :scrollbar.handlers.gitsigns :setup))
                            (let [gs package.loaded.gitsigns
                                  map (fn [mode lhs rhs desc]
                                        ((vim! :keymap.set) mode lhs rhs
                                                            {: buffer : desc}))]
                              (map :n :<leader>hg :<cmd>Lazygit<cr> :Lazygit)
                              (map :n "]h" gs.next_hunk "Next hunk")
                              (map :n "[h" gs.next_hunk "Prev hunk")
                              (map :n :<leader>hs gs.stage_hunk "Stage hunk")
                              (map :n :<leader>hu gs.stage_hunk "Unstage hunk")
                              (map :n :<leader>hS gs.stage_buffer
                                   "Stage buffer")
                              (map :n :<leader>hr gs.reset_hunk "Reset hunk")
                              (map :n :<leader>hR gs.reset_buffer
                                   "Reset buffer")
                              (map :n :<leader>hp gs.preview_hunk
                                   "Preview hunk")
                              (map :n :<leader>hb
                                   (fn [] (gs.blame_line {:full true}))
                                   "Blame line")
                              (map :n :<leader>hd gs.diffthis "Diff this")
                              (map :n :<leader>hD (fn [] (gs.diffthis "~"))
                                   "Diff this ~")))}})

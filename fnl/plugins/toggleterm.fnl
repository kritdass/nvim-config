(import-macros {: plug! : require!} :macros)
(import-macros {: command!} :hibiscus.vim)

(plug! :akinsho/toggleterm.nvim
       {:cmd [:ToggleTerm :ToggleTermToggleAll]
        :keys (fn []
                (let [terminal (require! :toggleterm.terminal :Terminal)
                      lazygit (terminal:new {:cmd :lazygit
                                             :close_on_exit true
                                             :direction :tab
                                             :dir :git_dir
                                             :name :lazygit})]
                  (command! [] :Lazygit `(lazygit:toggle))))
        :opts {:shade_terminals false}})

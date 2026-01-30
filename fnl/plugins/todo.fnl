(import-macros {: plug!} :macros)

(plug! :folke/todo-comments.nvim {:dependencies [:nvim-lua/plenary.nvim]
                                  :opts {}})

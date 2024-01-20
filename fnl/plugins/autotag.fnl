(import-macros {: plug!} :macros)

(plug! :windwp/nvim-ts-autotag {:ft [:html
                                     :javascript
                                     :javascriptreact
                                     :typescriptreact
                                     :markdown]
                                :opts {}})

(import-macros {: plug!} :macros)

(plug! :folke/persistence.nvim {:event :BufReadPre :opts {}})

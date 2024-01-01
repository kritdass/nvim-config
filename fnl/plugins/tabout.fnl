(import-macros {: plug!} :macros)

(plug! :abecodes/tabout.nvim {:opts {} :event [:BufReadPost :BufNewFile]})

(fn hl! [group val]
  `(vim.api.nvim_set_hl 0 ,group ,val))

(fn plug! [plugin ?opts]
  (doto (or ?opts {}) (tset 1 plugin)))

(fn require! [plugin item]
  `(. (require ,plugin) ,item))

(fn vim! [cmd]
  (sym (.. :vim. cmd)))

{: hl! : plug! : require! : vim!}

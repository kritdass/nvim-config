;; [nfnl-macro]

(fn hl! [group val]
  `(_G.vim.api.nvim_set_hl 0 ,group ,val))

(fn plug! [plugin ?opts]
  (doto (or ?opts {}) (tset 1 plugin)))

(fn require! [plugin item]
  `(. (require ,plugin) ,item))

(fn get! [opt]
  `(: (. _G.vim.opt_local ,opt) :get))

(fn set! [name ?val]
  (let [name (tostring name)
        invert? (= (string.sub name 1 2) :no)
        opt-name (if invert? (string.sub name 3) name)
        val (if (not= ?val nil) ?val
                invert? false
                true)]
    `(tset _G.vim.opt ,opt-name ,val)))

(fn setlocal! [name ?val]
  (let [name (tostring name)
        invert? (= (string.sub name 1 2) :no)
        opt-name (if invert? (string.sub name 3) name)
        val (if (not= ?val nil) ?val
                invert? false
                true)]
    `(tset _G.vim.opt_local ,opt-name ,val)))

(fn set+ [name val]
  `(: (. _G.vim.opt ,(tostring name)) :append ,val))

(fn color! [name]
  `(_G.vim.cmd.colorscheme ,name))

(fn g! [name val]
  `(tset _G.vim.g ,(tostring name) ,val))

(fn map! [params lhs rhs ?desc]
  (let [modes []
        opts {}]
    (each [_ val (ipairs params)]
      (if (= val :verbose) (tset opts :silent false) (= val :silent)
          (tset opts :silent true) (= val :remap) (tset opts :remap true)
          (= val :noremap) (tset opts :remap false) (= val :buffer)
          (tset opts :buffer 0) (= val :nowait) (tset opts :nowait true)
          (= val :expr) (tset opts :expr true) (= val :unique)
          (tset opts :unique true)
          (each [char (string.gmatch val ".")]
            (table.insert modes char))))
    (when ?desc (tset opts :desc ?desc))
    `(_G.vim.keymap.set ,modes ,lhs ,rhs ,opts)))

(fn augroup! [name ...]
  (let [group-sym (gensym :group)]
    `(let [,group-sym (_G.vim.api.nvim_create_augroup ,(tostring name)
                                                      {:clear true})]
       ,(unpack (icollect [_ cmd (ipairs [...])]
                  (let [[attr-list pattern handler] cmd
                        opts {:group group-sym : pattern}
                        events []]
                    (var next-is-desc? false)
                    (each [_ v (ipairs attr-list)]
                      (if next-is-desc?
                          (do
                            (tset opts :desc v)
                            (set next-is-desc? false))
                          (= (tostring v) :desc)
                          (set next-is-desc? true)
                          (= (tostring v) :buffer)
                          (tset opts :buffer 0)
                          (= (tostring v) :once)
                          (tset opts :once true)
                          (= (tostring v) :nested)
                          (tset opts :nested true)
                          (table.insert events (tostring v))))
                    (if (and (= (type handler) :table) (not (sym? handler)))
                        (tset opts :callback handler)
                        (tset opts :command (tostring handler)))
                    `(_G.vim.api.nvim_create_autocmd ,events ,opts)))))))

{: hl!
 : plug!
 : require!
 : get!
 : set!
 : setlocal!
 : set+
 : color!
 : g!
 : map!
 : augroup!}

(import-macros {: map! : command! : setlocal!} :hibiscus.vim)
(import-macros {: require! : vim!} :macros)

(let [wk (require :which-key)]
  (wk.register {:t {:name :+terminal}
                :x {:name :+trouble}
                :h {:name :+git}
                :b {:name :+buffer :s :+swap}
                :f {:name :+find}
                :q {:name :+quit}
                :u {:name :+toggle}
                :<tab> {:name :+tab}
                :w {:name :+window}} {:prefix :<leader>})
  (wk.register {:z {:name :+fold}
                :g {:name :+goto}
                "]" {:name :+next}
                "[" {:name :+prev}}))

(map! [:nixs :silent] :<C-s> "<cmd>:silent w<cr><esc>" "Save file")
(map! [:n] :<leader>l :<cmd>Lazy<cr> :Lazy)
(map! [:n] :<leader>M :<cmd>Mason<cr> :Mason)
(map! [:nv] :<leader>m :<cmd>MCstart<cr> :Multicursors)
(map! [:n] :<leader>a :<cmd>AerialToggle!<cr> :Aerial)

(let [terminal (require! :toggleterm.terminal :Terminal)
      lazygit (terminal:new {:cmd :lazygit
                             :close_on_exit true
                             :direction :tab
                             :dir :git_dir})]
  (command! [] :Lazygit `(lazygit:toggle)))

(map! [:n] :<leader>tg :<cmd>Lazygit<cr> "Launch lazygit")
(map! [:n] :<leader>th "<cmd>ToggleTerm direction=horizontal<cr>"
      "Horizontal terminal")

(map! [:n] :<leader>tv "<cmd>ToggleTerm direction=vertical size=70<cr>"
      "Vertical terminal")

(map! [:n] :<leader>t- "<cmd>ToggleTerm direction=horizontal<cr>"
      "Horizontal terminal")

(map! [:n] "<leader>t\\" "<cmd>ToggleTerm direction=vertical size=70<cr>"
      "Vertical terminal")

(map! [:n] :<leader>tf "<cmd>ToggleTerm direction=float<cr>"
      "Floating terminal")

(map! [:t] :<C-e> "<C-\\><C-n>" "Enter normal mode")
(map! [:nixst] "<C-\\>" :<cmd>ToggleTermToggleAll<cr> "Toggle terminal")

(map! [:n] :<leader>xx :<cmd>TroubleToggle<cr> :Trouble)
(map! [:n] :<leader>xw "<cmd>TroubleToggle workspace_diagnostics<cr>"
      "Workspace diagnostics")

(map! [:n] :<leader>xd "<cmd>TroubleToggle document_diagnostics<cr>"
      "Document diagnostics")

(map! [:n] :<leader>xq "<cmd>TroubleToggle quickfix<cr>" :Quickfix)

(map! [:n] :<leader>xl "<cmd>TroubleToggle loclist<cr>" "Location list")

(map! [:n] :<leader>e "<cmd>Neotree toggle<cr>" :Neotree)

(let [splits (require :smart-splits)]
  (map! [:n] :<A-h> splits.resize_left "Resize left")
  (map! [:n] :<A-j> splits.resize_down "Resize down")
  (map! [:n] :<A-k> splits.resize_up "Resize up")
  (map! [:n] :<A-l> splits.resize_right "Resize right")
  (map! [:n] :<C-h> splits.move_cursor_left "Move left")
  (map! [:n] :<C-j> splits.move_cursor_down "Move left")
  (map! [:n] :<C-k> splits.move_cursor_up "Move left")
  (map! [:n] :<C-l> splits.move_cursor_right "Move left")
  (map! [:n] :bsh splits.swap_buf_left "Swap left")
  (map! [:n] :bsj splits.swap_buf_down "Swap down")
  (map! [:n] :bsk splits.swap_buf_up "Swap up")
  (map! [:n] :bsl splits.swap_buf_right "Swap right"))

(let [ufo (require :ufo)]
  (map! [:n] :zR ufo.openAllFolds "Open all folds")
  (map! [:n] :zM ufo.closeAllFolds "Close all folds"))

(map! [:n] :<leader>ff "<cmd>Telescope find_files<cr>" "Find files")
(map! [:n] :<leader>fc "<cmd>Telescope find_files cwd=$HOME/.config/nvim<cr>"
      "Config files")

(map! [:n] :<leader>fs "<cmd>Telescope colorscheme enable_preview=true<cr>"
      "Find colorscheme")

(map! [:n] :<leader>fr "<cmd>Telescope oldfiles<cr>" "Recent files")
(map! [:n] :<leader>fu "<cmd>Telescope undo<cr>" "Undo history")
(map! [:n] :<leader>fy "<cmd>Telescope yank_history<cr>" "Yank history")
(map! [:n] :<leader>fm "<cmd>Telescope man_pages<cr>" "Find man pages")
(map! [:n] :<leader>fk "<cmd>Telescope keymaps<cr>" "Find keymaps")
(map! [:n] :<leader>fb "<cmd>Telescope current_buffer_fuzzy_find<cr>"
      "Search buffer")

(map! [:n] :<leader>fg "<cmd>Telescope git_commits<cr>" "Search Git commits")
(map! [:n] :<leader>fa "<cmd>Telescope aerial<cr>" "Search symbols")
(map! [:n] :<leader>fh "<cmd>Telescope help_tags<cr>" "Search help tags")

(let [flash (require :flash)]
  (map! [:nox] :s flash.jump :Flash)
  (map! [:nox] :S flash.treesitter "Flash Treesitter")
  (map! [:c] :<C-e> flash.toggle "Toggle Flash search"))

(map! [:n] :<leader>ww :<C-w>w "Other window")
(map! [:n] :<leader>wd :<C-w>c "Delete window")
(map! [:n] :<leader>wh :<C-w>s "Split window horizontally")
(map! [:n] :<leader>wv :<C-w>v "Split window vertically")
(map! [:n] :<leader>w- :<C-w>s "Split window horizontally")
(map! [:n] "<leader>w\\" :<C-w>v "Split window vertically")

(map! [:n] "[b" :<cmd>bprevious<cr> "Prev buffer")
(map! [:n] "]b" :<cmd>bnext<cr> "Next buffer")
(map! [:n] :<leader>bp :<cmd>bprevious<cr> "Prev buffer")
(map! [:n] :<leader>bn :<cmd>bnext<cr> "Next buffer")
(map! [:n] :<leader>bb "<cmd>e #<cr>" "Other buffer")
(map! [:n] :<leader>bd :<cmd>bdelete<cr> "Delete buffer")

(map! [:n] :<leader><tab>l :<cmd>tablast<cr> "Last tab")
(map! [:n] :<leader><tab>f :<cmd>tabfirst<cr> "First tab")
(map! [:n] :<leader><tab><tab> :<cmd>tabnew<cr> "New tab")
(map! [:n] :<leader><tab>d :<cmd>tabclose<cr> "Delete tab")
(map! [:n] :<leader><tab>n :<cmd>tabnext<cr> "Next tab")
(map! [:n] :<leader><tab>p :<cmd>tabprevious<cr> "Prev tab")
(map! [:n] "]<tab>" :<cmd>tabnext<cr> "Next tab")
(map! [:n] "[<tab>" :<cmd>tabprevious<cr> "Prev tab")

(map! [:n] :<leader>qq :<cmd>qa<cr> "Quit all")
(map! [:n] :<leader>qw :<C-w>c "Quit window")
(map! [:n] :<leader>qb :<cmd>bdelete<cr> "Quit buffer")
(map! [:n] :<leader>qt :<cmd>tabclose<cr> "Quit tab")
(map! [:n] :<leader>q<tab> :<cmd>tabclose<cr> "Quit tab")

(let [sev (fn [severity]
            (if severity (. (vim! :diagnostic.severity) severity) nil))
      next (fn [severity]
             (fn []
               ((vim! :diagnostic.goto_next) {:severity (sev severity)})))
      prev (fn [severity]
             (fn []
               ((vim! :diagnostic.goto_prev) {:severity (sev severity)})))]
  (map! [:n] "]d" (next) "Next diagnostic")
  (map! [:n] "[d" (prev) "Prev diagnostic")
  (map! [:n] "]e" (next :ERROR) "Next error")
  (map! [:n] "[e" (prev :ERROR) "Prev error")
  (map! [:n] "]w" (next :WARN) "Next warning")
  (map! [:n] "[w" (prev :WARN) "Prev warning"))

(let [toggle (fn [opt]
               (fn []
                 (setlocal! opt (not (: (. (vim! :opt_local) opt) :get)))))]
  (map! [:n] :<leader>us (toggle :spell) "Toggle spell")
  (map! [:n] :<leader>uw (toggle :wrap) "Toggle wrap")
  (map! [:n] :<leader>ur (toggle :relativenumber) "Toggle relative numbers")
  (map! [:n] :<leader>un (toggle :number) "Toggle line numbers"))

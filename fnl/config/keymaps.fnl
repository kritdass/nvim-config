(import-macros {: map! : setlocal! : get!} :macros)

(map! [:nixs :silent] :<C-s> "<cmd>:silent w<cr><esc>" "Save file")
(map! [:n :silent] :<leader>s "<cmd>:silent w<cr><esc>" "Save file")
(map! [:n] :<leader>l :<cmd>Lazy<cr> :Lazy)
(map! [:n] :<leader>m :<cmd>Mason<cr> :Mason)

(map! [:nt] :<leader>g (fn [] ((. _G.Snacks :lazygit))) :Lazygit)
(map! [:n] :<leader>T :<cmd>Typr<cr> :Typr)

(map! [:n] :<leader>th
      (fn []
        ((. _G.Snacks :terminal) nil {:win {:position :bottom :height 0.3}}))
      "Horizontal terminal")

(map! [:n] :<leader>tv
      (fn []
        ((. _G.Snacks :terminal) nil {:win {:position :right :width 0.4}}))
      "Vertical terminal")

(map! [:n] :<leader>t-
      (fn []
        ((. _G.Snacks :terminal) nil {:win {:position :bottom :height 0.3}}))
      "Horizontal terminal")

(map! [:n] "<leader>t\\"
      (fn []
        ((. _G.Snacks :terminal) nil {:win {:position :right :width 0.4}}))
      "Vertical terminal")

(map! [:n] :<leader>tf
      (fn []
        ((. _G.Snacks :terminal) nil {:win {:position :float}}))
      "Floating terminal")

(map! [:t] :<esc> "<C-\\><C-n>" "Enter normal mode")

(map! [:nixst] "<C-\\>" (fn [] ((. _G.Snacks.terminal :toggle)))
      "Toggle terminal")

(map! [:n] :<leader>xx "<cmd>Trouble diagnostics toggle<cr>" :Trouble)

(map! [:n] :<leader>xq "<cmd>Trouble qflist toggle<cr>" :Quickfix)

(map! [:n] :<leader>xl "<cmd>Trouble loclist toggle<cr>" "Location list")

(map! [:n] :<leader>e (fn [] ((. _G.Snacks :explorer))) :Explorer)

(map! [:n] :<leader>ff (fn [] ((. _G.Snacks.picker :files))) "Find files")

(map! [:n] :<leader>fc
      (fn []
        ((. _G.Snacks.picker :files {:cwd :$HOME/.config/nvim})))
      "Config files")

(map! [:n] :<leader>fs (fn [] ((. _G.Snacks.picker :colorschemes)))
      "Find colorscheme")

(map! [:n] :<leader>fr (fn [] ((. _G.Snacks.picker :recent))) "Recent files")

(map! [:n] :<leader>fu (fn [] ((. _G.Snacks.picker :undo))) "Undo history")

(map! [:n] :<leader>ft (fn [] ((. _G.Snacks.picker :grep))) :Grep)

(map! [:n] :<leader>fm (fn [] ((. _G.Snacks.picker :man))) "Find man pages")

(map! [:n] :<leader>fk (fn [] ((. _G.Snacks.picker :keymaps))) "Find keymaps")

(map! [:n] :<leader>fb (fn [] ((. _G.Snacks.picker :lines)))
      "Search buffer lines")

(map! [:n] :<leader>fg (fn [] ((. _G.Snacks.picker :git_log)))
      "Search Git commits")

(map! [:n] :<leader>fa (fn [] ((. _G.Snacks.picker :lsp_symbols)))
      "Search symbols")

(map! [:n] :<leader>fh (fn [] ((. _G.Snacks.picker :help))) "Search help tags")
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
                 (setlocal! opt (not (get! opt)))))]
  (map! [:n] :<leader>us (toggle :spell) "Toggle spell")
  (map! [:n] :<leader>uw (toggle :wrap) "Toggle wrap")
  (map! [:n] :<leader>ur (toggle :relativenumber) "Toggle relative numbers")
  (map! [:n] :<leader>un (toggle :number) "Toggle line numbers")
  (map! [:n] :<leader>ux :<cmd>TSContextToggle<cr> "Toggle context")
  (map! [:n] :<leader>ub "<cmd>Barbecue toggle<cr>" "Toggle breadcrumbs")
  (map! [:n] :<leader>uz (fn [] ((. _G.Snacks :zen))) "Toggle zen mode")
  (map! [:n] :<leader>ud
        (fn []
          (if (. _G.Snacks.dim :enabled)
              ((. _G.Snacks.dim :disable))
              ((. _G.Snacks.dim :enable)))) "Toggle dim")
  "Toggle dim"
  (map! [:n] :<leader>uh
        (fn []
          (if (= (get! :conceallevel) 0)
              (setlocal! :conceallevel 3)
              (setlocal! :conceallevel 0))) "Toggle conceal"))

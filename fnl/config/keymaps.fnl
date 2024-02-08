(import-macros {: map! : setlocal!} :hibiscus.vim)
(import-macros {: vim! : get!} :macros)

(map! [:nixs :silent] :<C-s> "<cmd>:silent w<cr><esc>" "Save file")
(map! [:n :silent] :<leader>s "<cmd>:silent w<cr><esc>" "Save file")
(map! [:n] :<leader>l :<cmd>Lazy<cr> :Lazy)
(map! [:n] :<leader>m :<cmd>Mason<cr> :Mason)
(map! [:n] :<leader>o "<cmd>Neotree document_symbols toggle<cr>" :Outline)
(map! [:nt] :<leader>g :<cmd>Lazygit<cr> "Launch lazygit")

(map! [:nt] :<leader>tg :<cmd>Lazygit<cr> "Launch lazygit")
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

(map! [:n] :<leader>tt "<cmd>ToggleTerm direction=tab<cr>" "Tab terminal")

(map! [:t] :<esc> "<C-\\><C-n>" "Enter normal mode")
(map! [:nixst] "<C-\\>" :<cmd>ToggleTermToggleAll<cr> "Toggle terminal")

(map! [:n] :<leader>xx :<cmd>TroubleToggle<cr> :Trouble)
(map! [:n] :<leader>xw "<cmd>TroubleToggle workspace_diagnostics<cr>"
      "Workspace diagnostics")

(map! [:n] :<leader>xd "<cmd>TroubleToggle document_diagnostics<cr>"
      "Document diagnostics")

(map! [:n] :<leader>xq "<cmd>TroubleToggle quickfix<cr>" :Quickfix)

(map! [:n] :<leader>xl "<cmd>TroubleToggle loclist<cr>" "Location list")

(map! [:n] :<leader>e "<cmd>Neotree toggle<cr>" :Neotree)

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
  (map! [:n] :<leader>uc :<cmd>ColorizerToggle<cr> "Toggle colorizer")
  (map! [:n] :<leader>uh
        (fn []
          (if (= (get! :conceallevel) 0)
              (setlocal! :conceallevel 3)
              (setlocal! :conceallevel 0))) "Toggle conceal"))

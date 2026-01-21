(import-macros {: set! : set+ : color!} :macros)

(color! :onelight)

(set! :number)
(set! :relativenumber)
(set! :cursorline)
(set! :laststatus 3)
(set! :signcolumn :yes)

(set! :tabstop 4)
(set! :softtabstop 4)
(set! :shiftwidth 4)
(set! :shiftround)
(set! :smartindent)
(set! :expandtab)

(set! :nowrap)
(set! :mouse :a)

(set! :noswapfile)
(set! :nobackup)
(set! :undofile)
(set! :nowritebackup)

(set! :incsearch)
(set! :nohlsearch)
(set! :ignorecase)
(set! :smartcase)

(set! :termguicolors)
(set! :spelllang :en)
(set! :fileencoding :utf-8)
(set! :guifont "JetBrainsMono Nerd Font:h13")

(set! :clipboard :unnamedplus)
(set! :completeopt "menu,menuone,noselect")

(set! :confirm)
(set! :conceallevel 3)

(set! :noshowmode)

(set! :grepformat "%f:%l:%c:%m")
(set! :grepprg "rg --vimgrep")

(set! :timeout)
(set! :timeoutlen 300)
(set! :updatetime 300)

(set+ :shortmess :c)

(set! :scrolloff 8)
(set! :sidescrolloff 8)

(set! :smoothscroll)

(set! :splitkeep :screen)
(set! :splitbelow)
(set! :splitright)

(set! :cmdheight 2)
(set! :pumheight 10)

(set! :foldenable)
(set! :foldlevel 99)
(set! :foldlevelstart 99)
(set! :foldcolumn :1)
(set! :fillchars {:eob " " :foldopen "" :foldsep " " :foldclose ""})

(let [signs {:Hint "󰌵" :Info "󰙎" :Warn "" :Error ""}]
  (each [type icon (pairs signs)]
    (let [hl (.. :DiagnosticSign type)]
      (_G.vim.fn.sign_define hl {:text icon :texthl hl :numhl hl}))))

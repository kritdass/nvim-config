(import-macros {: plug!} :macros)

(plug! :folke/snacks.nvim
       {:priority 1000
        :lazy false
        :opts {:dashboard {:enabled true
                           :preset {:header "
      ████ ██████           █████      ██                    
     ███████████             █████                            
     █████████ ███████████████████ ███   ███████████  
    █████████  ███    █████████████ █████ ██████████████  
   █████████ ██████████ █████████ █████ █████ ████ █████  
 ███████████ ███    ███ █████████ █████ █████ ████ █████ 
██████  █████████████████████ ████ █████ █████ ████ ██████"}}
               :bigfile {:enabled true}
               :explorer {:enabled true}
               :picker {:enabled true}
               :zen {:enabled true}
               :dim {:enabled true}
               :quickfile {:enabled true :exclude [:typst :snacks_dashboard]}
               :scroll {:enabled true}
               :statuscol {:enabled true}
               :rename {:enabled true}
               :lazygit {:enabled true}
               :indent {:enabled true}
               :scope {:enabled true}
               :words {:enabled true}
               :notifier {:enabled true :style :fancy}
               :terminal {:enabled true}}})

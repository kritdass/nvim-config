(import-macros {: hl!} :macros)
(local colors (require :colors))

(hl! :DashboardHeader {:fg colors.blue})
(hl! :DashboardKey {:fg colors.purple})
(hl! :DashboardIcon {:fg colors.green})
(hl! :DashboardDesc {:fg colors.green})
(hl! :DashboardFooter {:fg colors.yellow})

(hl! :BlinkCmpMenu {:bg "#FFFFFF" :fg "#383A42"})
(hl! :BlinkCmpMenuSelection {:bg "#F0F4FC" :fg :NONE :bold true})
(hl! :BlinkCmpMenuBorder {:fg "#E5E5E5" :bg "#FFFFFF"})

(hl! :BlinkCmpLabelMatch {:fg "#4078F2" :bold true})
(hl! :BlinkCmpGhostText {:fg "#A0A1A7"})
(hl! :BlinkCmpSource {:fg "#A0A1A7" :italic true})

(hl! :BlinkCmpKindFunction {:fg "#A626A4" :bg :NONE})
(hl! :BlinkCmpKindMethod {:fg "#A626A4" :bg :NONE})
(hl! :BlinkCmpKindKeyword {:fg "#A626A4" :bg :NONE})

(hl! :BlinkCmpKindVariable {:fg "#E45649" :bg :NONE})
(hl! :BlinkCmpKindField {:fg "#E45649" :bg :NONE})
(hl! :BlinkCmpKindProperty {:fg "#E45649" :bg :NONE})

(hl! :BlinkCmpKindClass {:fg "#C18401" :bg :NONE})
(hl! :BlinkCmpKindStruct {:fg "#C18401" :bg :NONE})
(hl! :BlinkCmpKindInterface {:fg "#C18401" :bg :NONE})

(hl! :BlinkCmpKindSnippet {:fg "#50A14F" :bg :NONE})
(hl! :BlinkCmpKindString {:fg "#50A14F" :bg :NONE})

(hl! :BlinkCmpKindConstant {:fg "#0184BC" :bg :NONE})

(hl! :BlinkCmpKindFile {:fg "#4078F2" :bg :NONE})
(hl! :BlinkCmpKindFolder {:fg "#4078F2" :bg :NONE})

(hl! :SnacksDim {:fg "#D0D0D0"})

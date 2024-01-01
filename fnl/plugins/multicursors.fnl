(import-macros {: plug!} :macros)

(plug! :smoka7/multicursors.nvim {:cmd [:MCstart
                                        :MCvisual
                                        :MCclear
                                        :MCpattern
                                        :MCvisualPatter
                                        :MCunderCursor]
                                  :dependencies [:smoka7/hydra.nvim]
                                  :opts {}})

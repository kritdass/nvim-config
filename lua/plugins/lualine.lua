-- :fennel:1707013693
local colors = require("colors")
local bubbles = {normal = {a = {fg = colors.bg, bg = colors.green}, b = {fg = colors.fg, bg = colors.gray}, c = {fg = colors.fg, bg = colors.black}}, insert = {a = {fg = colors.bg, bg = colors.blue}}, visual = {a = {fg = colors.bg, bg = colors.yellow}}, replace = {a = {fg = colors.bg, bg = colors.red}}, command = {a = {fg = colors.bg, bg = colors.purple}}, terminal = {a = {fg = colors.bg, bg = colors.cyan}}, inactive = {a = {fg = colors.fg, bg = colors.bg}, b = {fg = colors.fg, bg = colors.bg}, c = {fg = colors.bg, bg = colors.fg}}}
return {"nvim-lualine/lualine.nvim", event = "VeryLazy", dependencies = {"nvim-tree/nvim-web-devicons"}, opts = {options = {theme = bubbles, component_separators = "|", section_separators = {left = "\238\130\180", right = "\238\130\182"}, disabled_filetypes = {statusline = {"alpha"}}}, sections = {lualine_a = {{"mode", separator = {left = "\238\130\182"}, padding = {right = 2}}}, lualine_b = {"filename", "branch"}, lualine_c = {}, lualine_x = {}, lualine_y = {"filetype", "progress"}, lualine_z = {{"location", separator = {right = "\238\130\180"}, padding = {left = 2}}}}, inactive_sections = {lualine_a = {"filename"}, lualine_b = {}, lualine_c = {}, lualine_x = {}, lualine_y = {}, lualine_z = {"location"}}}}
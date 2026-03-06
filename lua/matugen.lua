 local M = {}

 function M.setup()
   require('base16-colorscheme').setup {
     -- Background tones
     base00 = '#ffffff', -- Default Background
     base01 = '#f6f8fa', -- Lighter Background (status bars)
     base02 = '#e9eef3', -- Selection Background
     base03 = '#8597a9', -- Comments, Invisibles
     -- Foreground tones
     base04 = '#656d76', -- Dark Foreground (status bars)
     base05 = '#1f2328', -- Default Foreground
     base06 = '#1f2328', -- Light Foreground
     base07 = '#1f2328', -- Lightest Foreground
     -- Accent colors
     base08 = '#cf222e', -- Variables, XML Tags, Errors
     base09 = '#8250df', -- Integers, Constants
     base0A = '#1a7f37', -- Classes, Search Background
     base0B = '#0969da', -- Strings, Diff Inserted
     base0C = '#3d1881', -- Regex, Escape Chars
     base0D = '#064793', -- Functions, Methods
     base0E = '#1a7f37', -- Keywords, Storage
     base0F = '#e9babe', -- Deprecated, Embedded Tags
   }
 end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M

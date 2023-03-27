local o = vim.opt

o.swapfile = false
o.showcmd = true

o.number = true
o.cursorline = true

o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2

o.foldmethod = "indent"
o.foldlevel = 99

o.clipboard = "unnamed"

-- 各plugins の設定
require('settings.001_neo-tree')
require('settings.002_lualine')
require('settings.003_indent-blankline')
require('settings.004_nightfox')
require('settings.005_telescope')
require('settings.006_diffview')


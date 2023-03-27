require'plugins'
require'settings'

vim.cmd[[ autocmd BufWritePost plugins.lua plugins.lua PackerCompile ]]


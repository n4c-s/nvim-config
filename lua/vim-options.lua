vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=2")

vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {}) 
vim.keymap.set('n', '<leader>q', ':q', {})

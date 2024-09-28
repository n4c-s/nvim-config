-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
-- Pluginssss 
   spec = {
    { import = "plugins" },
      }, 
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
}) 

require("vim-options")

-- Telescope
local builtin = require("telescope.builtin")

-- Lazy
require('lazy.view.config').keys.close = '<Esc>' 

-- Catppuccin
require("catppuccin").setup({
  flavour = "mocha"
})
vim.cmd.colorscheme "catppuccin"

-- Treesitter
require("nvim-treesitter").setup() 
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"html", "css", "javascript", "typescript", "c", "cpp", "c_sharp", "java", "json", "lua", "xml", "yaml", "scss", "python", "php"},
  highlight = { enable = true },
  indent = { enable = true }, 
})

-- Neotree


-- None-ls
local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
  }
})

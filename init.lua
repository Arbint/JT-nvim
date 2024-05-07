vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set rnu")
vim.g.mapleader=' '

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system(
    { 
      "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
    }
  )
end

vim.opt.rtp:prepend(lazypath)

local plugins = 
{
  { -- catppuccin color scheme
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require('catppuccin').setup()
      vim.cmd.colorscheme 'catppuccin'
    end,
  },

  { -- fuzzy finder
    "nvim-telescope/telescope.nvim",
    tag = '0.1.5',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    end
  },

  { -- tree sitter
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
      local config = require('nvim-treesitter.configs') 
      config.setup({
        ensure_installed = {'lua','python',"c"},
        highlight = {enabled = true},
        indent = {enable = true},
      })
    end,
  },
}

local opts = {}
require('lazy').setup(plugins, opts)


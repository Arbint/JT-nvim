return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  },

  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls', 'clangd', 'pylsp', 'cmake'}
      })
    end
  },

  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    config = function()
      require('mason-tool-installer').setup({
        ensure_installed = { 'stylua', 'cpplint', 'isort', 'black' }
      })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    config = function()
      -- this gets the auto completion command line interface tools(CLI) to link to lsp, so the server as lsp. 
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })

      lspconfig.clangd.setup({
        capabilities = capabilities
      })

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  },
}

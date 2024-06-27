return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "gopls",
          "clangd",
          "lua_ls",
          "jsonls",
          "svelte",
          "dockerls",
          "ruff_lsp",
          "tsserver",
          "rust_analyzer",
          "docker_compose_language_service"
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.gopls.setup({})
      lspconfig.clangd.setup({})
      lspconfig.lua_ls.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.svelte.setup({})
      lspconfig.dockerls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.ruff_lsp.setup({})
      lspconfig.rust_analyzer.setup({})
      lspconfig.docker_compose_language_service.setup({})

      -- Shift + k to open documentation
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

      -- g + d to go to definition
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})

      -- space + c + a for code action
      vim.keymap.set({ 'n' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}

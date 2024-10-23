-- plugins.lua (or wherever you define your LazyVim plugins)

return {
  { "neovim/nvim-lspconfig" }, -- For LSP support
  { "williamboman/nvim-lsp-installer" }, -- Easy LSP server installation
  { "jose-elias-alvarez/null-ls.nvim" }, -- For linters and formatters
  { "mfussenegger/nvim-dap" }, -- For debugging
  { "jayp0521/mason-null-ls.nvim" }, -- Install linters and formatters with mason

  -- ... your other LazyVim plugins ...

  {
    "neovim/nvim-lspconfig",
    config = function()
      -- LSP Configuration
      local lspconfig = require("lspconfig")
      lspconfig.pyright.setup({
        cmd = {
          "/Users/mdaams/.local/share/nvim/lsp_servers/python/node_modules/.bin/pyright-langserver",
          "--stdio",
        },
        -- settings = {
        --   python = {
        --     analysis = {
        --       useLibraryCodeForTypes = true,
        --       typeCheckingMode = "basic", -- or "strict" for stricter type checking
        --     },
        --   },
        -- },
      })
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      -- null-ls Configuration
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.black,
          null_ls.builtins.diagnostics.flake8,
        },
      })
    end,
  },

  {
    "mfussenegger/nvim-dap",
    config = function()
      -- nvim-dap Configuration (basic example)
      local dap = require("dap")
      dap.adapters.python = {
        type = "executable",
        command = "~/.pyenv/versions/3.11.10/bin/python",
        args = { "-m", "debugpy.adapter" },
      }
      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          program = "${file}", -- Launches the current file
          pythonPath = function()
            return "~/.pyenv/versions/3.11.10/bin/python"
          end,
        },
      }
    end,
  },
}

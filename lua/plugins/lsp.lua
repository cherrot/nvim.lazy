return {
  {
    -- https://www.lazyvim.org/plugins/lsp
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = true,
        exclude = { "vue", "go" },
      },
      diagnostics = {
        float = {
          border = "rounded",
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "gd", "<CMD>Glance definitions<CR>", desc = "Preview Definition" }
      keys[#keys + 1] = { "gr", "<CMD>Glance references<CR>", desc = "Preview References" }
      keys[#keys + 1] = { "gy", "<CMD>Glance type_definitions<CR>", desc = "Preview T[y]pe Definitions" }
      keys[#keys + 1] = { "gI", "<CMD>Glance implementations<CR>", desc = "Preview Implementations" }
    end,
  },
  -- provides a preview window for LSP
  {
    "DNLHC/glance.nvim",
    cmd = "Glance",
    opts = { border = { enable = true } },
  },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "make",
      })
    end,
  },

  -- add any tools you want to have installed below
  {
    "mason-org/mason.nvim",
    opts = {
      ui = { border = "rounded" },
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        -- "flake8", -- Python
        -- "bash-language-server", -- "bashls",
        -- "clangd",
        -- "html-lsp", -- "html",
        -- "json-lsp", -- "jsonls",
        -- "lua-language-server", -- "lua_ls",
        -- "python-lsp-server", -- pylsp
        -- "helm-ls",
        "buf",
      },
    },
  },
}

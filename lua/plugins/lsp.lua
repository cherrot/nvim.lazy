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
    "neovim/nvim-lspconfig", -- https://www.lazyvim.org/plugins/lsp
    opts = {
      servers = {
        ["*"] = {
          keys = {
            { "gd", "<cmd>Glance definitions<cr>", desc = "Preview Definition" },
            { "gr", "<cmd>Glance references<cr>", desc = "Preview References" },
            { "gy", "<cmd>Glance type_definitions<cr>", desc = "Preview T[y]pe Definitions" },
            { "gI", "<cmd>Glance implementations<cr>", desc = "Preview T[y]pe Implementations" },
          },
        },
      },
    },
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

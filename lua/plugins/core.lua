return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "catppuccin-frappe",
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin/nvim",
    opts = {
      transparent_background = true,
    },
  },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },

  -- https://www.lazyvim.org/configuration/recipes#use-eslint-for-fix-on-save-and-prettier-for-formatting
  { import = "lazyvim.plugins.extras.linting.eslint" },
  { import = "lazyvim.plugins.extras.formatting.prettier" },

  -- https://www.lazyvim.org/extras/coding/copilot
  { import = "lazyvim.plugins.extras.coding.copilot" },
  -- https://www.lazyvim.org/extras/lang/go
  { import = "lazyvim.plugins.extras.lang.go" },
  { import = "lazyvim.plugins.extras.lang.helm" },
  { import = "lazyvim.plugins.extras.lang.markdown" },
  -- https://www.lazyvim.org/extras/lang/python
  { import = "lazyvim.plugins.extras.lang.python" },
  { import = "lazyvim.plugins.extras.lang.rust" },
  { import = "lazyvim.plugins.extras.lang.svelte" },
  { import = "lazyvim.plugins.extras.lang.tailwind" },
  { import = "lazyvim.plugins.extras.lang.toml" },
  { import = "lazyvim.plugins.extras.lang.vue" },
  { import = "lazyvim.plugins.extras.lang.yaml" },
  -- https://www.lazyvim.org/extras/lsp/none-ls
  -- { import = "lazyvim.plugins.extras.lsp.none-ls" },

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
    "williamboman/mason.nvim",
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
        "buf-language-server",
      },
    },
  },
}

return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "catppuccin-frappe",
      colorscheme = "catppuccin-mocha",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      transparent_background = true,
      float = {
        transparent = true,
        solid = false, -- use solid styling for floating windows, see |winborder|
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  -- set border for LSP hover
  -- https://github.com/LazyVim/LazyVim/issues/556#issuecomment-1867981476
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        -- your dashboard configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        sections = {
          { section = "header" },
          {
            {
              section = "terminal",
              pane = 2,
              cmd = 'echo "\n\n\n\n\n"; pokemon-go-colorscripts -r --no-title',
              random = 10,
              indent = 4,
              height = 22,
              auto_close = false,
              enabled = function()
                return vim.o.columns > 127
              end,
            },
            { section = "keys", gap = 1, padding = 1 },
            { section = "startup" },
          },
          {
            section = "terminal",
            pane = 2,
            icon = " ",
            title = "jj Status",
            cmd = "jj st --no-pager",
            enabled = function()
              return vim.o.columns > 127 and vim.fn.isdirectory(".jj") == 1
            end,
            height = 12,
            padding = 1,
            ttl = 5 * 60,
            indent = 2,
          },
        },
      },
    },
  },
}

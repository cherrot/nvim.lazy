return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "catppuccin-frappe",
      colorscheme = "catppuccin",
    },
  },
  {
    -- workaround for LazyVim breaking change. see https://github.com/LazyVim/LazyVim/pull/6354#issuecomment-3202799735
    "akinsho/bufferline.nvim",
    init = function()
      local bufline = require("catppuccin.groups.integrations.bufferline")
      function bufline.get()
        return bufline.get_theme()
      end
    end,
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
}

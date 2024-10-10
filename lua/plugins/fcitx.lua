local enabled = vim.fn.executable("fcitx5-remote") == 1

if not enabled then
  return {}
end

local en = "keyboard-us"
-- local cn = "pinyin"
return {
  {
    "pysan3/fcitx5.nvim",
    event = "BufReadPost",
    opts = {
      msg = nil, -- string | nil: printed when startup is completed
      imname = { -- fcitx5.Imname | nil: imnames on each mode set as prior. See `:h map-table` for more in-depth information.
        norm = en, -- string | nil: imname to set in normal mode. if nil, will restore the mode on exit.
        ins = en,
        cmd = en,
        vis = en,
        sel = en,
        opr = en,
        term = en,
        lang = en,
      },
      remember_prior = false, -- boolean: if true, it remembers the mode on exit and restore it when entering the mode again.
      --                                 if false, uses what was set in config.
      define_autocmd = true, -- boolean: if true, defines autocmd at `ModeChanged` to switch fcitx5 mode.
      log = "warn", -- string: log level (default: warn)
    },
  },
}

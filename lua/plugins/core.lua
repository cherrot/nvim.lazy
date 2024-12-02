return {
  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },

  -- https://www.lazyvim.org/configuration/recipes#use-eslint-for-fix-on-save-and-prettier-for-formatting
  { import = "lazyvim.plugins.extras.linting.eslint" },
  { import = "lazyvim.plugins.extras.formatting.prettier" },

  -- https://www.lazyvim.org/extras/ai/copilot
  { import = "lazyvim.plugins.extras.ai.copilot" },
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
  -- show function name on the top line when scrolling
  { import = "lazyvim.plugins.extras.ui.treesitter-context" },
  -- yet another code outline plugin
  -- { import = "lazyvim.plugins.extras.editor.aerial" },

  { import = "lazyvim.plugins.extras.coding.mini-surround" },
  -- annotate (comment) your functions via <leader>cn
  { import = "lazyvim.plugins.extras.coding.neogen" },
}

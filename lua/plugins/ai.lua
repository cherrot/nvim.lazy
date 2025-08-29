-- if true then return {} end

return {
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        -- adding any nvim-cmp sources here will enable them
        -- with blink.compat
        compat = { "avante_commands", "avante_mentions", "avante_files" },
      },
    },
  },
  {
    "saghen/blink.compat",
    lazy = true,
    opts = {},
    config = function()
      -- monkeypatch cmp.ConfirmBehavior for Avante
      require("cmp").ConfirmBehavior = {
        Insert = "insert",
        Replace = "replace",
      }
    end,
  },
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    keys = {
      { "<leader>k", nil, desc = "AI/Claude Code" },
      { "<leader>kk", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>kf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>kr", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>kc", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>km", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      { "<leader>kb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<leader>ks", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<leader>ks",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
      },
      -- Diff management
      { "<leader>ka", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>kd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
  },
  {
    -- <Leader>aa to toggle sidebar
    "yetone/avante.nvim",
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    event = "VeryLazy",
    version = false, -- set this if you want to always pull the latest change
    ---@module 'avante'
    ---@type avante.Config
    opts = {
      ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
      ---@type Provider
      provider = "moonshot",
      ---@alias Mode "agentic" | "legacy"
      ---@type Mode
      mode = "agentic",
      auto_suggestions_provider = "moonshot",

      providers = {
        -- claude = {
        --   endpoint = "https://aihubmix.com",
        --   api_key_name = "AIHUBMIX_API_KEY",
        --   model = "claude-sonnet-4-20250514",
        --   timeout = 30000,
        --   extra_request_body = {
        --     temperature = 0.75,
        --     max_tokens = 20480,
        --   },
        -- },
        moonshot = {
          endpoint = os.getenv("ANTHROPIC_BASE_URL"),
          api_key_name = "ANTHROPIC_API_KEY",
          model = "kimi-k2-turbo-preview",
          timeout = 30000,
          extra_request_body = {
            temperature = 0.6,
            max_tokens = 32768,
          },
        },
        openai = {
          -- endpoint = os.getenv("OPENAI_ENDPOINT") .. "/v1",
          endpoint = "https://aihubmix.com",
          api_key_name = "AIHUBMIX_API_KEY",
          model = "gpt-4.1-mini",
          timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
          extra_request_body = {
            temperature = 0,
            max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
            reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
          },
        },

        aihubmix = {
          model = "gemini-2.5-pro",
          timeout = 30000,
          extra_request_body = {
            temperature = 0,
            max_completion_tokens = 8192,
            reasoning_effort = "medium",
          },
        },
        quick = {
          __inherited_from = "openai",
          model = "aihubmix-router",
        },
      },

      -- -- these tools may conflict with mcp-hub
      -- disabled_tools = {
      --   "list_files",
      --   "search_files",
      --   "read_file",
      --   "create_file",
      --   "rename_file",
      --   "delete_file",
      --   "create_dir",
      --   "rename_dir",
      --   "delete_dir",
      --   "bash",
      -- },
      behaviour = {
        auto_suggestions = true, -- Experimental stage
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
      },
      file_selector = {
        --- @alias FileSelectorProvider "native" | "fzf" | "telescope" | string
        provider = "fzf",
        -- Options override for custom providers
        provider_opts = {},
      },

      -- other config
      -- The system_prompt type supports both a string and a function that returns a string. Using a function here allows dynamically updating the prompt with mcphub
      system_prompt = function()
        local hub = require("mcphub").get_hub_instance()
        return hub:get_active_servers_prompt()
      end,
      -- The custom_tools type supports both a list and a function that returns a list. Using a function here prevents requiring mcphub before it's loaded
      custom_tools = function()
        return {
          require("mcphub.extensions.avante").mcp_tool(),
        }
      end,
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "folke/snacks.nvim", -- for input provider snacks
      "echasnovski/mini.icons",
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            -- use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },

  {
    "ravitemer/mcphub.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
    },
    -- comment the following line to ensure hub will be ready at the earliest
    cmd = "MCPHub", -- lazy load by default
    build = "npm install -g mcp-hub@latest", -- Installs required mcp-hub npm module
    -- uncomment this if you don't want mcp-hub to be available globally or can't use -g
    -- build = "bundled_build.lua",  -- Use this and set use_bundled_binary = true in opts  (see Advanced configuration)
    config = function()
      require("mcphub").setup()
    end,
  },
}

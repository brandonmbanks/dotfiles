return {
  "olimorris/codecompanion.nvim",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "nvim-lua/plenary.nvim" },
    { "github/copilot.vim" },
    -- {
    --   "saghen/blink.cmp",
    --   lazy = false,
    --   version = "*",
    --   opts = {
    --     keymap = {
    --       preset = "enter",
    --       ["<S-Tab>"] = { "select_prev", "fallback" },
    --       ["<Tab>"] = { "select_next", "fallback" },
    --     },
    --     cmdline = { sources = { "cmdline" } },
    --     sources = {
    --       default = { "lsp", "path", "buffer", "codecompanion" },
    --     },
    --   },
    -- },
  },
  config = function()
    -- vim.env["CODECOMPANION_TOKEN_PATH"] = vim.fn.expand("~/.config")
    vim.api.nvim_set_keymap("i", "<S-Tab>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

    require("codecompanion").setup({
      opts = {
        -- model options (not complete):
        -- gpt-5
        -- claude-3.7-sonnet
        -- gemini-2.0-flash
        -- gemini-2.5-pro
        strategies = {
          --NOTE: Change the adapter as required
          agent = { adapter = "copilot", model = "gemini-2.5-pro" },
          chat = { adapter = "copilot", model = "gemini-2.5-pro" },
          inline = { adapter = "copilot", model = "gemini-2.5-pro" },
        },
        opts = {
          log_level = "DEBUG",
        },
      },
    })
  end,
  keys = {
    {
      "<C-a>",
      "<cmd>CodeCompanionActions<CR>",
      desc = "Open the action palette",
      mode = { "n", "v" },
    },
    {
      "<Leader>c",
      "<cmd>CodeCompanionChat Toggle<CR>",
      desc = "Toggle a chat buffer",
      mode = { "n", "v" },
    },
    {
      "<LocalLeader>a",
      "<cmd>CodeCompanionChat Add<CR>",
      desc = "Add code to a chat buffer",
      mode = { "v" },
    },
  },
}

return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "windwp/nvim-ts-autotag",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      highlight = {
        enable = true,
      },
      -- enable indentation
      indent = { enable = true },
      -- autoclose and rename tags
      autotag = {
        enable = true,
      },
      ensure_installed = {
        "bash",
        "lua",
        "go",
        "rust",
        "sql",
        "vim",
      },
      -- Automatically install missing parsers when entering buffer
      auto_install = true,
    })
  end,
}

return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "windwp/nvim-ts-autotag",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "vrischmann/tree-sitter-templ",
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
        "templ",
      },
      -- Automatically install missing parsers when entering buffer
      auto_install = true,
    })

    vim.filetype.add({
      extension = {
        templ = "templ",
      },
    })
  end,
}

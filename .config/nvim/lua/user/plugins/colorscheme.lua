return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000, -- make sure to load this first
  config = function()
    vim.o.background = "dark"

    require("rose-pine").setup({
      dark_variant = "moon",
    })

    vim.cmd("colorscheme rose-pine")
  end,
}

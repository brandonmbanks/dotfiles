return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000, -- make sure to load this first
  config = function()
    vim.o.background = "dark"

    require("rose-pine").setup({
      dark_variant = "moon",
      styles = { italic = false, transparency = true },
      highlight_groups = {
        Comment = { italic = true },
      },
    })

    vim.cmd("colorscheme rose-pine")
  end,
}

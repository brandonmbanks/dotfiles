return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "goimports" },
        terraform = { "terraform_fmt" },
        tf = { "terraform_fmt" },
      },
      format_on_save = {
        timeout_ms = 3000,
        lsp_format = "fallback",
      },
    })

    vim.keymap.set({ "n", "v" }, "<Leader>f", function()
      require("conform").format({
        timeout_ms = 3000,
        lsp_format = "fallback",
      })
    end, { desc = "Format file or range" })
  end,
}

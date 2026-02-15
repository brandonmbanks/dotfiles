return {
  "leoluz/nvim-dap-go",
  ft = "go",
  dependencies = "mfussenegger/nvim-dap",
  config = function(_, opts)
    require("dap-go").setup(opts)

    local dap = require("dap")
    vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP: Continue" })
    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
    vim.keymap.set("n", "<leader>dn", dap.step_over, { desc = "DAP: Step Over" })
    vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "DAP: Step Into" })
    vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "DAP: Step Out" })
    vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "DAP: Toggle REPL" })
    vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "DAP: Run Last" })
  end,
}

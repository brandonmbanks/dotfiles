return {
  "leoluz/nvim-dap-go",
  ft = "go",
  dependencies = "mfussenegger/nvim-dap",
  config = function(_, opts)
    mappings = {
      -- Debugging
      ["n <leader>dc"] = { "<cmd>lua require('dap').continue()<CR>", "Continue" },
      ["n <leader>db"] = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "Toggle Breakpoint" },
      ["n <leader>dn"] = { "<cmd>lua require('dap').step_over()<CR>", "Step Over" },
      ["n <leader>di"] = { "<cmd>lua require('dap').step_into()<CR>", "Step Into" },
      ["n <leader>do"] = { "<cmd>lua require('dap').step_out()<CR>", "Step Out" },
      ["n <leader>dr"] = { "<cmd>lua require('dap').repl.toggle()<CR>", "Toggle Repl" },
      ["n <leader>dl"] = { "<cmd>lua require('dap').run_last()<CR>", "Run Last" },
    }
    require("dap-go").setup(opts)
  end,
}

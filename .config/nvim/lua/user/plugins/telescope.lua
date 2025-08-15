return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        preview = {
          treesitter = false,
        },
        mappings = {
          n = {
            ["<C-d>"] = require("telescope.actions").delete_buffer,
          },
          i = {
            ["<C-d>"] = require("telescope.actions").delete_buffer,
          },
        },
      },
      pickers = {
        find_files = {
          find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
        },
      },
    })

    telescope.load_extension("live_grep_args")

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<Leader>ff", builtin.find_files)
    vim.keymap.set("n", "<Leader>p", builtin.find_files)
    vim.keymap.set("n", "<Leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
    vim.keymap.set("n", "<Leader>fb", builtin.buffers)
    vim.keymap.set("n", "<Leader>fh", builtin.help_tags)
    vim.keymap.set("n", "<Leader>Gb", builtin.git_branches)
    vim.keymap.set("n", "<Leader>fs", builtin.lsp_document_symbols)
    vim.keymap.set("n", "<Leader>fd", builtin.diagnostics)
    vim.keymap.set("n", "gr", function()
      builtin.lsp_references({ show_line = false })
    end)
    vim.keymap.set("n", "gi", builtin.lsp_implementations)
    vim.keymap.set("n", "<Leader>fd", builtin.diagnostics)
    vim.keymap.set("n", "<Leader>fc", builtin.commands)
  end,
}

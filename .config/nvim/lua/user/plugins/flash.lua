return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    -- type 2+ chars, labels appear at matches, press label to jump
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    -- select treesitter nodes (functions, blocks, etc.) by label
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    -- operate on remote location, e.g. yr<label>w yanks a word elsewhere
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    -- combine search with treesitter node selection
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
  },
}

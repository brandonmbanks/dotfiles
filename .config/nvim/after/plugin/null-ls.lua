local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
    null_ls.builtins.formatting.goimports,
}

null_ls.setup({ sources = sources })

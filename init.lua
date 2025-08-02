--  And then you can explore or search through `:help lua-guide`
-- https://neovim.io/doc/user/lua-guide.html

--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
-- [[ Setting options ]]
require("custom.config.options")

-- [[ Basic Keymaps ]]
require("custom.config.keymaps")

-- [[ Install `lazy.nvim` plugin manager ]]
require("custom.config.lazy")

-- [[ Configure Language Servers ]]
require("custom.config.lsp")

-- vim: ts=2 sts=2 sw=2 et

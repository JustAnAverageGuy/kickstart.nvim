--
--  NOTE: Must happen before plugins are required  otherwise wrong leader will be used
--
-- [[ Setting options ]]
require 'custom.config.options'

-- [[ Basic Keymaps ]]
require 'custom.config.keymaps'

-- [[ Configure diagnostics ]]
require 'custom.config.diagnostics'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'custom.config.lazy'

-- [[ Configure Language Servers ]]
require 'custom.config.lsp'

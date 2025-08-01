return {
  -- Autocompletion
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    {
      -- snippets
      'L3MON4D3/LuaSnip',
      build = (function()
        -- Build Step is needed for regex support in snippets.
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then return end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        -- Adds a number of user-friendly snippets
        'rafamadriz/friendly-snippets',
        config = function()
          require('luasnip.loaders.from_vscode').lazy_load({ paths = { './snippets' } })
          require('luasnip.loaders.from_vscode').lazy_load()
          require('luasnip').filetype_extend('html', { 'loremipsum' })
          require('luasnip').filetype_extend('markdown', { 'tex' })
        end
      }
    },
    'saadparwaiz1/cmp_luasnip',

    -- Adds LSP completion capabilities
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    -- dictionary completion
    {
      'uga-rosa/cmp-dictionary',
      opts = {
        paths = {"/usr/share/dict/words"},
        first_case_insensitive = true,
        exact_length = 4,
      },
    },
  },
  config = function()
    -- See `:help cmp`
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    luasnip.config.setup {}

    cmp.setup {
      snippet = {
        expand = function(args) luasnip.lsp_expand(args.body) end,
      },
      completion = { completeopt = 'menu,menuone,noinsert,noselect', },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert {
        -- see :h ins-completion
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- scroll documentation [b]ack and [f]orward
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        -- ['<C-y>'] = cmp.mapping.confirm { select = false, }, -- use <c-y> to accept completion
        ['<cr>'] = cmp.mapping.confirm { select = false, }, -- use <c-y> to accept completion
        ['<C-Space>'] = cmp.mapping.complete {},                   -- manually trigger completion
        ['<C-l>'] = cmp.mapping(function()                         -- <c-l> will move you to the right of each of the expansion locations.
          if luasnip.expand_or_locally_jumpable() then luasnip.expand_or_jump() end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function() -- <c-h> is similar, except moving you backwards.
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),
      },
      sources = {
        { name = 'lazydev', group_index = 0 }, -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'render-markdown' },
        -- { name = 'dictionary', keyword_length = 4,  },
      },
    }
  end
}

-- vim: ts=2 sts=2 sw=2 et

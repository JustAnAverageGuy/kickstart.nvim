---@module 'lazy'
---@type LazyPluginSpec
return {
  'nvim-treesitter/nvim-treesitter',
  -- The old `master` branch is the frozen Neovim 0.11 implementation. The
  -- default `main` branch is the supported, rewritten API for Neovim 0.12.
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  dependencies = {
    {
      'nvim-treesitter/nvim-treesitter-textobjects',
      branch = 'main',
      config = function()
        require('nvim-treesitter-textobjects').setup {
          select = { lookahead = true },
          move = { set_jumps = true },
        }

        local select = require 'nvim-treesitter-textobjects.select'
        local textobjects = {
          aa = '@parameter.outer',
          ia = '@parameter.inner',
          af = '@function.outer',
          ['if'] = '@function.inner',
          ac = '@class.outer',
          ic = '@class.inner',
          ['a/'] = '@comment.outer',
          ['i/'] = '@comment.outer',
        }
        for lhs, query in pairs(textobjects) do
          vim.keymap.set({ 'x', 'o' }, lhs, function()
            select.select_textobject(query, 'textobjects')
          end, { desc = 'Select ' .. query })
        end

        local move = require 'nvim-treesitter-textobjects.move'
        local movements = {
          [']m'] = { move.goto_next_start, '@function.outer' },
          [']]'] = { move.goto_next_start, '@class.outer' },
          [']M'] = { move.goto_next_end, '@function.outer' },
          [']['] = { move.goto_next_end, '@class.outer' },
          ['[m'] = { move.goto_previous_start, '@function.outer' },
          ['[['] = { move.goto_previous_start, '@class.outer' },
          ['[M'] = { move.goto_previous_end, '@function.outer' },
          ['[]'] = { move.goto_previous_end, '@class.outer' },
        }
        for lhs, movement in pairs(movements) do
          vim.keymap.set({ 'n', 'x', 'o' }, lhs, function()
            movement[1](movement[2], 'textobjects')
          end, { desc = 'Treesitter textobject movement' })
        end

        local swap = require 'nvim-treesitter-textobjects.swap'
        vim.keymap.set('n', '<leader>a', function()
          swap.swap_next '@parameter.inner'
        end, { desc = 'Swap with next parameter' })
        vim.keymap.set('n', '<leader>A', function()
          swap.swap_previous '@parameter.inner'
        end, { desc = 'Swap with previous parameter' })
      end,
    },
  },
  config = function()
    local treesitter = require 'nvim-treesitter'
    treesitter.setup {}

    -- Register the custom MIPS parser using the rewritten parser API.
    vim.api.nvim_create_autocmd('User', {
      pattern = 'TSUpdate',
      callback = function()
        require('nvim-treesitter.parsers').mips = {
          install_info = {
            url = 'https://github.com/omeyenburg/tree-sitter-mips',
            branch = 'main',
          },
        }
      end,
    })
    vim.treesitter.language.register('mips', 'mips')

    local parsers = {
      'bash',
      'c',
      'diff',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'latex',
      'query',
      'vim',
      'vimdoc',
    }

    -- The new installer requires tree-sitter-cli >= 0.26.1. Avoid a noisy
    -- failed install when only the tree-sitter library is installed.
    if vim.fn.executable 'tree-sitter' == 1 then
      treesitter.install(parsers)
    end

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('custom-treesitter', { clear = true }),
      pattern = '*',
      callback = function(event)
        local ok = pcall(vim.treesitter.start, event.buf)
        if ok and vim.bo[event.buf].filetype ~= 'ruby' then
          vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })

    -- Neovim 0.12 provides incremental selection as visual-mode `an`/`in`.
    -- Preserve the old Ctrl-Space gesture for expanding to the parent node.
    vim.keymap.set('x', '<C-Space>', 'an', { remap = true, desc = 'Expand Treesitter selection' })
  end,
}

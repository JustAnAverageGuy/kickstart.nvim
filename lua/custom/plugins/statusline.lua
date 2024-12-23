return {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        -- icons_enabled = false,
        -- theme = 'catppuccin-mocha',
        theme = 'dracula',
        -- component_separators = '|',
        -- section_separators = '',
      },
      extensions = {
        {
          filetypes = { 'CompetiTest' },
          sections = {
            lualine_b = { function()
              ---@diagnostic disable-next-line: undefined-field
              return vim.b.competitest_title or 'CompetiTest'
            end },
            lualine_y = { 'searchcount' },
            lualine_z = { "change this sometime" },
          },
          inactive_sections = {
            lualine_b = { function()
              ---@diagnostic disable-next-line: undefined-field
              return vim.b.competitest_title or 'CompetiTest'
            end },
          },
        } -- CompetiTest statusline
      }
    },
  }

return {
  {
    "q60/vim-brainfuck",
    ft = "brainfuck",
  },
  {
    "fladson/vim-kitty",
    ft = "kitty",
  },
  --[[
 __  __          _      _
|  \/  |__ _ _ _| |____| |_____ __ ___ _
| |\/| / _` | '_| / / _` / _ \ V  V / ' \
|_|  |_\__,_|_| |_\_\__,_\___/\_/\_/|_||_|

    ]]
  {
    "ellisonleao/glow.nvim",
    ---@module 'glow'
    ---@type Config
    opts = {
      border = "single",
    },
    cmd = "Glow"
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'echasnovski/mini.icons', -- if you use standalone mini plugins
    },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      code = {
        position  = 'right',
        width     = 'block',
        left_pad  = 1,
        right_pad = 1,
        border    = 'thick', -- TODO: doesn't seem to do anything, see later
      },
      pipe_table = {
        preset = 'round',
        cell = 'trimmed',
      },
      latex = { enabled = false, },
      link = {
        custom = {
          wikipedia = { pattern = 'wikipedia%.org', icon = '󰖬 ' },
        },
      },
      heading = {
        sign = false,
        border = true,
        below = "▔",
        above = "▁",
        left_pad = 0,
        position = "inline",
        icons = {
          "█ ",
          "██ ",
          "███ ",
          "████ ",
          "█████ ",
          "██████ ",
        },
      },
      completions = {
        lsp = { enabled = true },
      }
    },
    ft = "markdown",
    cmd = "RenderMarkdown",
  },
  {
    'opdavies/toggle-checkbox.nvim',
    keys = {
      {
        '<leader>tt',
        function()
          require('toggle-checkbox').toggle()
        end,
        mode = "n",
        ft = "markdown",
        desc = "Toggle checkbox",
      }
    },
    ft = { 'markdown' },

  },
  --[[
 ___     _
/ __| __| |_  ___ _ __  ___
\__ \/ _| ' \/ -_) '  \/ -_)
|___/\__|_||_\___|_|_|_\___|

    ]]
  {
    'gpanders/nvim-parinfer',
    ft = { 'scheme' },
  },
}

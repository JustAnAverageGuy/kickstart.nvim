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
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      code = {
        position  = 'right',
        width     = 'block',
        left_pad  = 1,
        right_pad = 1,
        border    = 'thick', -- TODO: doesn't seem to do anything, see later
      }
    },
    ft = "markdown",
    cmd = "RenderMarkdown",
  }
}

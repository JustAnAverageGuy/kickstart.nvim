return {
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
        position = 'right',
        width = 'block',
        left_pad  = 1,
        right_pad = 1,
        border = 'thick', -- TODO: doesn't seem to do anything, see later
      }
    },
    ft = "markdown",
    cmd = "RenderMarkdown",
  }
}

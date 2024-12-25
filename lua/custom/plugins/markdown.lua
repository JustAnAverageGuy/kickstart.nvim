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
    opts = {},
    ft = "markdown",
    cmd = "RenderMarkdown",
  }
}

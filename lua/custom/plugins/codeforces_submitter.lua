local plugin_dir = vim.env.CODEFORCES_SUBMITTER_DIR or vim.fn.expand '~/Tools/codeforces_submitter_vim'

---@module "lazy"
---@type LazyPluginSpec
return {
  -- "JustAnAverageGuy/CodeForce.vim",
  dir = plugin_dir,
  name = 'codeforces_submitter.vim',
  enabled = function()
    return vim.fn.isdirectory(plugin_dir) == 1
  end,
  dependencies = {
    {
      'rcarriga/nvim-notify',
      config = function()
        vim.notify = require 'notify'
        require('notify').setup {
          stages = 'fade',
          background_colour = '#000000',
        }
      end,
    },
  },
  keys = {
    {
      '<M-C-S>',
      '<cmd>CodeForceSubmit<cr>',
      { 'n' },
      desc = 'Submit code to codeforces, needs to have problem url in the source',
    },
  },
}

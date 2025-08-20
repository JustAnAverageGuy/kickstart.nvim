---@module "lazy"
---@type LazyPluginSpec | LazyPluginSpec[]
return {
  {
    -- see :h colorizer.lua
    'norcalli/nvim-colorizer.lua',
    opts = {
      ['css']  = { css = true },
      ['html'] = { css = true },
      'js',
    }, -- NOTE: cannot use the second "default" argument this way, but whatever
    ft = { 'css', 'html', 'js' },
    cmd = { 'ColorizerToggle' },
  },
  {
    ---@alias buffer integer
    'm00qek/baleia.nvim',
    version = '*',
    config = function()
      vim.g.baleia = require('baleia').setup {}

      -- Command to colorize the current buffer
      vim.api.nvim_create_user_command('BaleiaColorize', function()
        vim.g.baleia.once(vim.api.nvim_get_current_buf())
      end, { bang = true })

      -- Command to show logs
      vim.api.nvim_create_user_command('BaleiaLogs', vim.g.baleia.logger.show, { bang = true })
    end,
  },
}

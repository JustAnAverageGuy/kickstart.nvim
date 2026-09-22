---@module "lazy"
---@type LazyPluginSpec | LazyPluginSpec[]
return {
  {
    -- The original repository still calls vim.tbl_flatten, which is
    -- deprecated in Neovim 0.12. This maintained fork preserves the plugin
    -- while adding current Neovim APIs and 0.12 document-color handling.
    'catgoose/nvim-colorizer.lua',
    opts = {
      filetypes = {
        'javascript',
        'javascriptreact',
        css = { parsers = { css = true } },
        html = { parsers = { css = true } },
      },
    },
    ft = { 'css', 'html', 'javascript', 'javascriptreact' },
    cmd = { 'ColorizerToggle' },
  },
  {
    ---@alias buffer integer
    'm00qek/baleia.nvim',
    -- Track current main. The last tagged release still contains test
    -- submodules that were removed on main and can break recursive checkout.
    submodules = false,
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

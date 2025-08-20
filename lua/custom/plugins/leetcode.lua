local leet_arg = 'leetcode'
---@module "lazy"
---@type LazyPluginSpec
return {
  'kawre/leetcode.nvim',
  build = ':TSUpdate html',
  lazy = leet_arg ~= vim.fn.argv(0, -1),
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim', -- required by telescope
    'MunifTanjim/nui.nvim',

    -- optional
    'nvim-treesitter/nvim-treesitter',
    'rcarriga/nvim-notify',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    lang = 'python3',
    arg = leet_arg,
    storage = { home = vim.fn.getcwd() },
  },
  config = function(_, opts)
    require('leetcode').setup(opts)
    -- a way to set keymaps only when the plugin is loaded
    -- otherwise this keymap interferes with lazy triggers and loads competitest
    vim.keymap.set('n', '<M-C-B>', '<cmd>Leet test<CR>', { desc = 'leetcode test' })
    vim.keymap.set('n', '<M-C-S>', '<cmd>Leet submit<CR>', { desc = 'leetcode submit' })
  end,
}

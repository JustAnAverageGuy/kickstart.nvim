-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.g.neo_tree_remove_legacy_commands = 1

  ---@module "lazy"
  ---@type LazyPluginSpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "\\", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    { "<leader>\\", "<cmd>Neotree reveal<cr>", desc = "NeoTree show in directory" },
  },
  lazy = false,
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    }
  },
}

---@module "lazy"
---@type LazyPluginSpec
return {
  "aaronik/treewalker.nvim",
  opts = {
    highlight = true -- default is false
  },
  keys = {
    { "<Up>",    "<cmd>Treewalker Up<CR>",    { "n" }, desc = "Treewalker up" },
    { "<Down>",  "<cmd>Treewalker Down<CR>",  { "n" }, desc = "Treewalker down" },
    { "<Right>", "<cmd>Treewalker Right<CR>", { "n" }, desc = "Treewalker right" },
    { "<Left>",  "<cmd>Treewalker Left<CR>",  { "n" }, desc = "Treewalker left" },
  },
}


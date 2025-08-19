---@module "lazy"
---@type LazyPluginSpec |  LazyPluginSpec[]
return {
  {
    "Eandrju/cellular-automaton.nvim",
    name = "celullar_automaton",
    cmd = { "CellularAutomaton", },
    -- keys={
    --   {"<leader>fml", "<cmd>CellularAutomaton make_it_rain<cr>", {"n"},desc="make it rain"},
    -- }
  },
  {
    "letieu/hacker.nvim",
    opts = {},
    -- keys = { { '<leader>hk', '<cmd>HackFollow<CR>', { 'n' }, desc = "the hackerman experience" } },
    cmd = { "Hack", "HackAuto", "HackFollowAuto", "HackFollow" },
  },
}

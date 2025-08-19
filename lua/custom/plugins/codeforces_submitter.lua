---@module "lazy"
---@type LazyPluginSpec
return
{
  -- "JustAnAverageGuy/CodeForce.vim",
  dir = "/home/aks/Tools/codeforces_submitter_vim",
  name = "codeforces_submitter.vim",
  dependencies = {
    {
      "rcarriga/nvim-notify",
      config = function()
        vim.notify = require("notify");
        require("notify").setup({
          stages = "fade",
          background_colour = "#000000",
        });
      end
    }
  },
  keys = {
    { "<M-C-S>", "<cmd>CodeForceSubmit<cr>", { 'n' }, desc = "Submit code to codeforces, needs to have problem url in the source" },
  }
}

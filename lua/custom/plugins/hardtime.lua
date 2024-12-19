return
{
   "m4xshen/hardtime.nvim",
   dependencies = { "MunifTanjim/nui.nvim" },
   opts = {
         disable_mouse=false, -- enable mouse because I like it
         disabled_keys = {
            -- enable the following keys again, since I use them for treewalker
            ["<Up>"] = {},
            ["<Down>"] = {},
            ["<Left>"] = {},
            ["<Right>"] = {},
         },
      }
}

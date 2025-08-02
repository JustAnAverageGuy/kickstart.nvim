-- quality of life and miscellaneous features

return {
  --[[ Detect tabstop and shiftwidth automatically
                           _         _         _   
   __ _ _  _ ___ ______   (_)_ _  __| |___ _ _| |_ 
  / _` | || / -_|_-<_-<___| | ' \/ _` / -_) ' \  _|
  \__, |\_,_\___/__/__/   |_|_||_\__,_\___|_||_\__|
  |___/                                            
                                                  ]]
  { 'NMAC427/guess-indent.nvim', opts = {}, },

  --[[
   _ _    _
  (_) |__| |
  | | '_ \ |
  |_|_.__/_|
             ]]
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      whitespace = { remove_blankline_trail = false },
      indent = {
        char = { '▏', '▎', '▍', '▌', '▋', '▊', '▉', '█' },
        --[[ highlight = {
          "RainbowRed",
          "RainbowYellow",
          "RainbowBlue",
          "RainbowOrange",
          "RainbowGreen",
          "RainbowViolet",
          "RainbowCyan",
        } ]]
      }
    },
  },
  -- "gc" to comment visual regions/lines
  --[[
                              _
   __ ___ _ __  _ __  ___ _ _| |_
  / _/ _ \ '  \| '  \/ -_) ' \  _|
  \__\___/_|_|_|_|_|_\___|_||_\__|
                                   ]]
  { 'numToStr/Comment.nvim', opts = {} },
  --[[
                _              _
 __ _ __ __ ___| |___ _ _ __ _| |_ ___
/ _` / _/ _/ -_) / -_) '_/ _` |  _/ -_)
\__,_\__\__\___|_\___|_| \__,_|\__\___|

  ]]
  {
    'rainbowhxch/accelerated-jk.nvim',
    keys = {
      { 'j', '<Plug>(accelerated_jk_gj)', 'n', desc = "accelerate down" },
      { 'k', '<Plug>(accelerated_jk_gk)', 'n', desc = "accelerate up" },
    }
  },
  --[[
    _ _    _ _
 __(_) |__| (_)_ _  __ _     ____ __ ____ _ _ __
(_-< | '_ \ | | ' \/ _` |   (_-< V  V / _` | '_ \
/__/_|_.__/_|_|_||_\__, |   /__/\_/\_/\__,_| .__/
                   |___/                   |_|
  ]]
  -- TODO: eliminate this, use something like mini.ai instead
  {
    "Wansmer/sibling-swap.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {},
    keys = { "<C-.>", "<C-,>", "<leader>.", "<leader>," },
  },
  --[[
 _        _                _ _ _
| |_  ___| |_ __   ____ __| (_) |_
| ' \/ -_) | '_ \ (_-< '_ \ | |  _|
|_||_\___|_| .__/ /__/ .__/_|_|\__|
           |_|       |_|
  ]]
  {
    "anuvyklack/help-vsplit.nvim",
    opts =
    {
      always = false, -- always open help in vertical split
      side = 'left',  -- 'left' or 'right'
      buftype = { 'help' },
      filetype = { 'man' },
    },
  },

  -- TODO: maybe use mini plugins instead of notify and dressing
  --[[
          _   _  __
 _ _  ___| |_(_)/ _|_  _
| ' \/ _ \  _| |  _| || |
|_||_\___/\__|_|_|  \_, |
                    |__/
  ]]
  {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify");
      require("notify").setup({
        stages = "fade",
        background_colour = "#000000",
      });
    end
  },
  --[[
  -- Better `more` support
    _               _
 __| |_ _ ___ _____(_)_ _  __ _
/ _` | '_/ -_|_-<_-< | ' \/ _` |
\__,_|_| \___/__/__/_|_||_\__, |
                          |___/
  ]]
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  --[[
  --Progress spinners **
  __ _    _          _   
 / _(_)__| |__ _ ___| |_ 
|  _| / _` / _` / -_)  _|
|_| |_\__,_\__, \___|\__|
           |___/         
  ]]
  {
    "j-hui/fidget.nvim",
    opts = {
      -- options
    },
  },
  --[[
 _   _         _    _____
| | | |_ _  __| |__|_   _| _ ___ ___
| |_| | ' \/ _` / _ \| || '_/ -_) -_)
 \___/|_||_\__,_\___/|_||_| \___\___|

  ]]
  {
    "mbbill/undotree",
    cmd = { "UndotreeToggle", "UndotreeShow" },
  },
  --[[
   _       _       ___      _
  /_\ _  _| |_ ___| _ \__ _(_)_ _
 / _ \ || |  _/ _ \  _/ _` | | '_|
/_/ \_\_,_|\__\___/_| \__,_|_|_|

 ]]
  {
    "windwp/nvim-autopairs",
    -- Optional dependency
    event = "InsertEnter",
    dependencies = { 'hrsh7th/nvim-cmp' },
    opts = {
      disable_filetype = { "scheme" }, -- handled by nvim_parinfer
    },
    --   -- If you want to automatically add `(` after selecting a function or method
    -- config = function()
    --   require("nvim-autopairs").setup {}
    --   local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    --   local cmp = require('cmp')
    --   cmp.event:on(
    --     'confirm_done',
    --     cmp_autopairs.on_confirm_done()
    --   )
    -- end,
  },
  --[[
 _
(_)_ __  __ _ __ _ ___
| | '  \/ _` / _` / -_)
|_|_|_|_\__,_\__, \___|
             |___/
  ]]
  -- lazy.nvim
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      image = {
        doc = {
          inline = false,
        },
      },
    }
  }
}

return {
  "rcarriga/nvim-notify",
  config = function ()
    vim.notify = require("notify");
    require("notify").setup({
      stages = "fade",
      background_colour = "#000000",
    });
  end
}

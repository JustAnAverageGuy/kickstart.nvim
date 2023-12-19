return {
    "JustAnAverageGuy/cphelper.nvim",

    -- dir = "../../codin/cp/neovim_cphelper_plugin",
    -- dev = true,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        -- cph = {
        --     dir = "~/codin/cp/contests"
        -- }
        vim.g["cph#dir"] = "./here"
        vim.g["cph#lang"] = "python"
    end
}

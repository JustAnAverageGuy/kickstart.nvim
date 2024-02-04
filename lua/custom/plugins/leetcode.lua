local leet_arg = "leetcode"
return {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    lazy = leet_arg ~= vim.fn.argv()[1],
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim", -- required by telescope
        "MunifTanjim/nui.nvim",

        -- optional
        "nvim-treesitter/nvim-treesitter",
        "rcarriga/nvim-notify",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("leetcode").setup({
            lang = 'python3',
            arg = leet_arg,
            directory = vim.fn.getcwd(),
        });
        vim.keymap.set('n', '<M-C-B>', '<cmd>Leet test<CR>');
        vim.keymap.set('n', '<M-C-S>', '<cmd>Leet submit<CR>');
    end,
}

-- import my vscode snippets :)

return {
    'L3MON4D3/LuaSnip',

    -- Adds a number of user-friendly snippets
    dependencies = {
        'rafamadriz/friendly-snippets',
    },

    config = function()
        require('luasnip.loaders.from_vscode').lazy_load({
            paths = './snippets'
        });
        require('luasnip.loaders.from_vscode').lazy_load();
        require('luasnip').filetype_extend("html", {"loremipsum"});
    end

}

return
{
  "Olical/conjure",
  ft = { "clojure", "fennel", "scheme" }, -- etc
  lazy = true,
  -- Optional cmp-conjure integration
  dependencies = {
    {
      "PaterJason/cmp-conjure",
      lazy = true,
      config = function()
        local cmp = require("cmp")
        local config = cmp.get_config()
        table.insert(config.sources, { name = "conjure" })
        return cmp.setup(config)
      end,
    },
  },
  -- uses a global variables based approach for config instead of a setup function
  -- config = function(_, opts) return opts end
}

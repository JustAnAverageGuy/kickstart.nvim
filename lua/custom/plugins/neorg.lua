local function configured_path(variable, fallback)
    return vim.fn.expand(vim.env[variable] or fallback)
end

local workspaces = {
    notes = configured_path("NEORG_NOTES_DIR", "~/notes"),
    journal = configured_path("NEORG_JOURNAL_DIR", "~/journal"),
}

local networks = configured_path("NEORG_NETWORKS_DIR", "~/codin/cso_assignments/cse433/notes")
if vim.env.NEORG_NETWORKS_DIR or vim.fn.isdirectory(networks) == 1 then
    workspaces.computer_networks = networks
end

return {
    "nvim-neorg/neorg",
    -- Neorg explicitly recommends eager loading; command/filetype lazy loading
    -- can leave some modules only partially initialized.
    lazy = false,
    version = '*',
    dependencies = {
        "benlubas/neorg-conceal-wrap",
    },
    keys = {
        { '<localleader>nn', desc = "[Neorg] new note" },
        { 'gO',              '<cmd>Neorg toc<CR>',              ft = "norg", desc = "[Neorg] Table of Contents" },
        { '<localleader>ct', '<cmd>Neorg toggle-concealer<CR>', ft = "norg", desc = "[Neorg] Concealer Toggle" },
    },
    -- Neorg is a startup plugin, while lazy.nvim normally adds rock-provided
    -- parser paths slightly later. Add those paths before setup so launching
    -- Neovim directly on a .norg file starts highlighting that first buffer.
    config = function(_, opts)
        local rocks_root = vim.fn.stdpath 'data' .. '/lazy-rocks'
        for _, rock in ipairs { 'tree-sitter-norg', 'tree-sitter-norg-meta' } do
            local cpath = rocks_root .. '/' .. rock .. '/lib/lua/5.1/?.so'
            if not package.cpath:find(cpath, 1, true) then
                package.cpath = cpath .. ';' .. package.cpath
            end
        end
        require('neorg').setup(opts)
    end,
    opts = {
        load = {
            ["core.defaults"] = {},

            ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
            ["core.integrations.nvim-cmp"] = {},
            ["core.concealer"] = {
                config = {
                    icon_preset = "diamond",
                    icons = {
                        todo = {
                            -- cancelled = { icon = " " },
                            -- done = { icon = '󰱒 ' },
                            -- on_hold = { icon = "" },
                            -- pending = { icon = '󰥔 ' },
                            -- recurring = { icon = "↺" },
                            -- uncertain = { icon = " " },
                            -- undone = { icon = '󰄱 ' },
                            -- urgent = { icon = "⚠ " },
                        },

                    },
                }
            },
            ["core.dirman"] = {
                config = {
                    workspaces = {
                        notes = workspaces.notes,
                        journal = workspaces.journal,
                        computer_networks = workspaces.computer_networks,
                    },
                    -- default_workspace = "notes",
                }
            },
            ["core.esupports.metagen"] = { config = { type = "auto", update_date = true }, },
            ["core.export"] = {},
            ["core.export.html"] = {},
            ["core.export.markdown"] = { config = { extensions = "all" } },
            ["core.journal"] = {
                config = {
                    workspace = "journal",
                }
            },
            ["core.keybinds"] = {
                -- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
                config = {
                    default_keybinds = true,
                    -- neorg_leader = "<Leader><Leader>",
                    -- neorg_leader = ",",
                },
            },
            ["core.looking-glass"] = {},
            ["core.summary"] = {},
            ["core.qol.toc"] = {},
            ["core.qol.todo_items"] = {},
            ["core.ui.calendar"] = {},

            ["external.conceal-wrap"] = {},
        },
    },
}

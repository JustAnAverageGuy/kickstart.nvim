return {
    "nvim-neorg/neorg",
    -- lazy = false,
    version = '*',
    dependencies = {
        "benlubas/neorg-conceal-wrap",
    },
    ft = "norg",
    cmd = "Neorg",
    keys = {
        { '<localleader>nn', desc = "[Neorg] new note" },
        { 'gO',              '<cmd>Neorg toc<CR>',              ft = "norg", desc = "[Neorg] Table of Contents" },
        { '<localleader>ct', '<cmd>Neorg toggle-concealer<CR>', ft = "norg", desc = "[Neorg] Concealer Toggle" },
    },
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
                        notes = "~/notes",
                        journal = "~/journal",
                        computer_networks = "~/codin/cso_assignments/cse433/notes", -- move this to notes eventually
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

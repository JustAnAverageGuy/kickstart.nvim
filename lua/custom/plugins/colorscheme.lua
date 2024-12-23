return
--[[
{
    "rebelot/kanagawa.nvim",
    -- lazy = true,
    priority = 1000,
    opts = { transparent = false, },
    config = function()

        vim.cmd('colorscheme kanagawa-wave')
    end,
}
--]]
{
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        -- flavour = "macchiato",     -- latte, frappe, macchiato, mocha
        show_end_of_buffer = true,     -- shows the '~' characters after the end of buffers
        transparent_background = true, -- disables setting the background color.
        custom_highlights = function(colors)
            return {
                Comment     = { fg = colors.subtext1 },
                LineNr      = { fg = colors.yellow, style = { "bold", "standout" } },
                LineNrBelow = { fg = colors.yellow, bg = colors.surface0 },
                LineNrAbove = { fg = colors.yellow, bg = colors.surface0 },
            }
        end,
        integrations = {
            indent_blankline = {
                enabled = true,
                scope_color = "",
                colored_indent_levels = true,
            }
        },
    },
    init = function()
        vim.cmd.colorscheme "catppuccin"
    end
}
--[[
  base = "#1e1e2e",
  blue = "#89b4fa",
  crust = "#11111b",
  flamingo = "#f2cdcd",
  green = "#a6e3a1",
  lavender = "#b4befe",
  mantle = "#181825",
  maroon = "#eba0ac",
  mauve = "#cba6f7",
  overlay0 = "#6c7086",
  overlay1 = "#7f849c",
  overlay2 = "#9399b2",
  peach = "#fab387",
  pink = "#f5c2e7",
  red = "#f38ba8",
  rosewater = "#f5e0dc",
  sapphire = "#74c7ec",
  sky = "#89dceb",
  subtext0 = "#a6adc8",
  subtext1 = "#bac2de",
  surface0 = "#313244",
  surface1 = "#45475a",
  surface2 = "#585b70",
  teal = "#94e2d5",
  text = "#cdd6f4",
  yellow = "#f9e2af"

]]

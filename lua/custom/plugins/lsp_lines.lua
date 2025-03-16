return {
  url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  opts = {
    -- default options
    -- box_drawing_characters = {
    --   vertical = "│",
    --   vertical_right = "├",
    --   horizontal_up = "┴",
    --   cross = "┼",
    --   up_right = "└",
    --   horizontal = "─",
    -- },
  },
  config = function(_, opts)
    vim.diagnostic.config({ virtual_text = false, })
    require('lsp_lines').setup(opts)
    require('lsp_lines').toggle() -- start off since it is triggered with leader l anyways, which toggles it
  end,
  dependencies = { 'neovim/nvim-lspconfig' },
  keys = {
    {
      '<leader>l',
      function()
        require('lsp_lines').toggle()
        -- vim.diagnostic.config({ virtual_text = true, })
      end,
      desc = "toggle lsp lines"
    },
  },
}

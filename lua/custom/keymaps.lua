-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ Custom Keymaps/Keybinds ]]
vim.keymap.set('i', '<C-s>', '<C-o>:update<CR>', {desc="Save file with ctrl-s when in insert mode"}) -- ctrl s saves the file in insert mode
vim.keymap.set({'n'}, '<leader>cp', '<cmd>%y+<CR>',{desc="Copy file contents to system clipboard"})

vim.api.nvim_create_user_command("W", "write", {}) -- avoid typos

vim.keymap.set({'v', 'n'}, '<leader>y', '"+y', {desc="Yank into system clipboard"})

-- move lines using J, K in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- when in visual mode leader pu replaces the selection with yanked text without losing the yank
vim.keymap.set("x", "<leader>pu", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>du", [["_d]]) -- deletes into the void register


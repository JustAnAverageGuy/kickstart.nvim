-- LSP related keymaps and config {{{
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end
    -- Jump to the definition of the word under your cursor.
    --  This is where a variable was first declared, or where a function is defined, etc.
    --  To jump back, press <C-t>.
    map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

    -- Fuzzy find all the symbols in your current document.
    --  Symbols are things like variables, functions, types, etc.
    map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

    -- Fuzzy find all the symbols in your current workspace.
    map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- Rename the variable under your cursor.
    --  Most Language Servers support renaming across files, etc.
    -- map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame') -- grn in nvim 0.11

    -- Execute a lsp code action
    -- map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' }) -- gra in nvim 0.11

    -- map('K', vim.lsp.buf.hover, 'Hover Documentation') -- default
    -- map('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation') -- CTRL-S in nvim 0.11

    -- WARN: This is not Goto Definition, this is Goto Declaration.
    --  For example, in C this would take you to the header.
    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')


    local client = vim.lsp.get_client_by_id(event.data.client_id)
    -- The following code creates a keymap to toggle inlay hints in your
    -- code, if the language server you are using supports them
    -- This may be unwanted, since they displace some of your code

    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
      map('<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
      end, '[T]oggle Inlay [H]ints')
    end
    map('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    map('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    map('<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
      '[W]orkspace [L]ist Folders')
    -- vim.api.nvim_buf_create_user_command(event.buf, 'Format', function(_) vim.lsp.buf.format() end, { desc = 'Format current buffer with LSP' })
    map('<leader>f', vim.lsp.buf.format, '[F]ormat current buffer with LSP')
  end,
})
-- }}}

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = vim.tbl_deep_extend(
  'force', capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)
capabilities = vim.tbl_deep_extend(
  -- using 'error' since cmp_nvim_lsp probably doesnot have workspace rename capabilities
  -- and even if it does have it, I don't want to unknowingly overwrite them
  'error', capabilities,
  require('lsp-file-operations').default_capabilities()
)

vim.lsp.config('*', {
  capabilities = capabilities,
})

local enabled_servers = {
  "basedpyright",
  "clangd",
  "gopls",
  "lua_ls",
  "marksman",
  "ruff",
  "ts_ls",
  -- "carbon",
}

vim.lsp.enable(enabled_servers);

-- vim: ts=2 sts=2 sw=2 fdm=marker fen et

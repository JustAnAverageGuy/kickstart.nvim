return {
  cmd = { 'carbon', 'language-server' },
  filetypes = { 'carbon' },
  root_dir = vim.fs.dirname(vim.fs.find('.git', { upward = true })[1]),
}

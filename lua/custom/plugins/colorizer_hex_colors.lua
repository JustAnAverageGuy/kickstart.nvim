-- see :h colorizer.lua
return {
  'norcalli/nvim-colorizer.lua',
  opts = {
    ['css']  = { css = true, },
    ['html'] = { css = true, },
    'js',
  }, -- NOTE: cannot use the second "default" argument this way, but whatever
  ft = { 'css', 'html', 'js' },
  cmd = { 'ColorizerToggle' }
}

return {
  "xeluxee/competitest.nvim",
  lazy = true,
  dependencies = { 'MunifTanjim/nui.nvim', },
  opts = {
    companion_port = 12172,
    run_command = {
      python = { exec = 'pypy', args = { "$(FNAME)" } },
    },
    received_files_extension = "py",
  },
}

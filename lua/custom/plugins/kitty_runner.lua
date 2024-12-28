return {
  "lolpie244/simple-kitty-runner.nvim",
  opts = {
    runner = {
      default_location = "after",                       -- default location of runner. Docs: https://sw.kovidgoyal.net/kitty/remote-control/#cmdoption-kitty-launch-location
      delay = 0,                                        -- delay between opening runner and sending command.
      extra_open_runner_args = { "--dont-take-focus" }, -- extra arguments for opening runner, Docs: https://sw.kovidgoyal.net/kitty/remote-control/#id14
      extra_send_command_args = {},                     -- extra arguments for sending command to runner, docs: https://sw.kovidgoyal.net/kitty/remote-control/#id22
      env_to_copy = { "PATH" }                          -- environment variables, that will be copy to the runner instance
    },
    launch = {
      default_location = "after",                       -- default location of launch result. Docs: https://sw.kovidgoyal.net/kitty/remote-control/#cmdoption-kitty-launch-location
      extra_launch_args = {},                           -- extra arguments for launching to runner. Docs: https://sw.kovidgoyal.net/kitty/remote-control/#cmdoption-kitty-launch-location
      env_to_copy = { "PATH" },                         -- environment variables, that will be copy to the launcher instance
    },
    -- NOTE: need to set `allow_remote_control=yes` and `listen_on unix:/tmp/kitty` (or some other path) to kitty.conf
    kitty_listen_on = vim.fn.getenv("KITTY_LISTEN_ON"), -- socket where kitty is listening. See ssh section
  },
  cmd = { "KittyLaunch", "KittyClear", "KittyOpenRunner", "KittySendToRunner" },
  keys = {
    {
      "<leader>x",
      function()
        vim.api.nvim_command('update') -- save current buffer if it is unsaved before trying to execute it
        local command = string.format("py %s", vim.fn.expand('%:p'))
        require("kitty-runner").send_to_runner(command)
      end,
      { 'n' },
      ft = 'python',
      desc = "execute python file in 😼"
    },
  },
}

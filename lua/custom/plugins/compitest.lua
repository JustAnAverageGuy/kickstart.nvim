return {
	"xeluxee/competitest.nvim",
	lazy = true,
	dependencies = { 'MunifTanjim/nui.nvim' },
	opts = {
		companion_port = 12172,
		runner_ui = { interface = "split" },
		run_command = {
			python = { exec = 'pypy', args = { "$(FNAME)" } },
		},
		received_files_extension = "py",
		testcases_directory = "./testcases/",
		template_file = {
			py = "~/codin/cp/python_template.py"
		},
		evaluate_template_modifiers = true,
		date_format = '%A %d %B %Y %H-%M-%S %z',
		split_ui = {
			total_width = 0.45,
			vertical_layout = {
				{ 1, {
					{ 1, "si" },
					{ 1, "tc" },
					{ 1, "se" },
				},
				},
				{ 1, {
					{ 1, "eo" },
					{ 1, "so" },
				} },
			},
		},
	},
	init = function()
		vim.api.nvim_create_user_command("Recv", "CompetiTest receive problem",
			{ desc = "Receives problem from CP companion" })
	end,
	cmd = {
		"CompetiTest"
	},
	keys = {
		{
			"<M-C-B>",
			"<cmd>CompetiTest run<cr>",
			{ "n", "i" },
			desc = "CompetiTest run the testcases",
		},
	}
}

return {
	"xeluxee/competitest.nvim",
	lazy = true,
	dependencies = { 'MunifTanjim/nui.nvim' },
	opts = {
		companion_port = 12172,
		runner_ui = {
			interface = "split",
			mappings = {
				run_all_again = "<leader>jj"
			}
		},
		run_command = {
			python = { exec = 'pypy3', args = { "$(FNAME)" } },
		},
		received_files_extension = "py",
		received_problems_path = function(task, file_extension)
			-- local default_path = "$(CWD)/$(PROBLEM).$(FEXT)";
			local cwd = vim.fn.getcwd()
			local problem_name_with_spaces = task.name
			local problem_name_without_spaces = string.gsub(
				problem_name_with_spaces,
				'[<>:"/\\|?* %.-]', "_"
			); -- strips out spaces and other special characters and replaces them with underscores
			assert(vim.fn.has("win32") ~= 1, "The received problem path may be wrong");
			-- WARN: This should not be a problem since paths are handled by lua, so using '/' even in windows etc should work
			return cwd .. '/' .. problem_name_without_spaces .. '.' .. file_extension
		end,
		testcases_directory = "./testcases/",
		template_file = {
			py = "~/codin/cp/python_template.py"
		},
		evaluate_template_modifiers = true,
		date_format = '%A %d %B %Y %H:%M:%S %z',
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
			"<leader>re",
			"<cmd>CompetiTest receive problem<cr>",
			{ "n", },
			desc = "CompetiTest receive problem",
		},
		{
			"<leader>ad",
			"<cmd>CompetiTest add_testcase<cr>",
			{"n"},
			desc = "CompetiTest add custom testcases"
		},
		{
			"<leader>jj",
			"<cmd>CompetiTest run<cr>",
			{ "n" },
			desc = "CompetiTest run the testcases",
		},
		{
			"<M-C-B>",
			"<cmd>CompetiTest run<cr>",
			{ "n", "i" },
			desc = "CompetiTest run the testcases",
		},
	}
}

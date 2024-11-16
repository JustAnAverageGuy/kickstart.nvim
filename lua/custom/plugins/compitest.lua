return {
	"xeluxee/competitest.nvim",
	lazy = true,
	dependencies = { 'MunifTanjim/nui.nvim' },
	opts = {
		companion_port = 12172,
		runner_ui = {
			interface = "split",
			mappings = {
				run_all_again = "<leader>ck"
			}
		},
		run_command = {
			python = { exec = '/usr/bin/pypy3', args = { "$(FNAME)" } },
		},
		received_files_extension = "py",
		received_problems_path = function(task, file_extension)
			-- local default_path = "$(CWD)/$(PROBLEM).$(FEXT)";
			local beginning = require("competitest.receive").eval_receive_modifiers("$(CWD)/", task,
				file_extension, true);
			local problem_name_with_spaces = require("competitest.receive").eval_receive_modifiers(
			"$(PROBLEM)", task, file_extension, true) or "this_didnt_match_problem_name";
			local problem_name_without_spaces = string.gsub(problem_name_with_spaces, '[<>:"/\\|?* %.-]', "_"); -- strips out spaces and other special characters and replaces them with underscores
			-- assert(vim.fn.has("win32") ~= 1, "The received problem path will be wrong");
			-- WARN: This should not be a problem since paths are handled by lua, so using '/' even in windows etc should work
			return beginning .. problem_name_without_spaces .. '.' .. file_extension
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
			"<leader>ck",
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

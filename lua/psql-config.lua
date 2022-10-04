require("psql").setup({
	database_name = "postgresql://postgres:TOANzyYUkMEE9RPB%40NEDtBx8DPzVkFcd@localhost:4000/warehouse",
	execute_line = "<leader>el",
	execute_selection = "<leader>es",
	execute_paragraph = "<leader>r",

	close_latest_result = "<leader>w",
	close_all_results = "<leader>W",
})

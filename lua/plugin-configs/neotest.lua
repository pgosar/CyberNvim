require("neotest").setup({
	adapters = {
		require("neotest-python")({
			dap = { justMyCode = false },
			args = {"--log-level", "DEBUG"},
			runner = "pytest",
			python = ".venv/bin/python",
			pytest_discover_instances = true,
		}),
		require("neotest-bash"),
		require("neotest-gtest"),
	}
})

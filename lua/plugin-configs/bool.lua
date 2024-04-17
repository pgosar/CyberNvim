require("toggle-bool").setup({
	mapping = "<leader>tt",
	additional_toggles = {
		All = "None",
		Allow = "Deny",
		Before = "After",
		Enable = "Disable",
		Enabled = "Disabled",
		First = "Last",
		Ingress = "Egress",
		Internal = "External",
		On = "Off",
		Persistent = "Ephemeral",
		Yes = "No",
		["0"] = "1",
	},
})

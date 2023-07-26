local autosave = require("auto-save")
autosave.setup({
	debounce_delay = 5000,
	trigger_events = { "InsertLeave" },
})

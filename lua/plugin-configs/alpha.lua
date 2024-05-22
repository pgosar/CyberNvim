local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	" ▗▄▖ ▗▄▖    █                      ▗▄▄▄▖               	 ",
	" █▀█ ▝▜▌    ▀                      ▝▀█▀▘                    ",
	"▐▌ ▐▌ ▐▌   ██  ▐▙ ▟▌ ▟█▙  █▟█▌       █  ▐███▌ ▟█▙ ▐▙██▖ ▟█▟▌",
	"▐▌ ▐▌ ▐▌    █   █ █ ▐▙▄▟▌ █▘         █    ▗▛ ▐▙▄▟▌▐▛ ▐▌▐▛ ▜▌",
	"▐▌ ▐▌ ▐▌    █   ▜▄▛ ▐▛▀▀▘ █          █   ▗▛  ▐▛▀▀▘▐▌ ▐▌▐▌ ▐▌",
	" █▄█  ▐▙▄ ▗▄█▄▖ ▐█▌ ▝█▄▄▌ █          █  ▗█▄▄▖▝█▄▄▌▐▌ ▐▌▝█▄█▌",
	" ▝▀▘   ▀▀ ▝▀▀▀▘  ▀   ▝▀▀  ▀          ▀  ▝▀▀▀▘ ▝▀▀ ▝▘ ▝▘ ▞▀▐▌",
	"                                                        ▜█▛▘",
}
dashboard.section.buttons.val = {
	dashboard.button("n", "  > 新檔案", ":lua require('core.utils').create_new_file()<CR>"),
	dashboard.button("t", "  > 於 git repo 中尋找檔案", ":Telescope git_files <CR>"),
	dashboard.button("r", "  > 最近存取", ":Telescope oldfiles<CR>"),
	dashboard.button("l", "🗘  > 開啟上次存取的檔案", ":SessionManager load_last_session<CR>"),
}

local fortune = require("alpha.fortune")
dashboard.section.footer.val = fortune()

require("alpha").setup(dashboard.opts)

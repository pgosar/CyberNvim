-- overrides vim.lsp.buf.rename() so that it provides notifications for the completed rename
local function _rename()
	local param = vim.lsp.util.make_position_params()
	param.old = vim.fn.expand("<cword>")
	vim.ui.input({ prompt = "rename to> ", default = param.old }, function(input)
		if input == nil then
			vim.notify("aborted", "warn", { title = "[LSP] rename", render = "compact" })
			return
		end
		param.newName = input
		vim.lsp.buf_request(0, "textDocument/rename", param, function(err, result, ctx, config)
			if not result or (not result.documentChanges and not result.changes) then
				vim.notify(
					string.format("could not perform rename: %s -> %s", param.old, param.newName),
					"error",
					{ title = "[LSP] rename", timeout = 500 }
				)
				return
			end
			vim.lsp.handlers["textDocument/rename"](err, result, ctx, config)
			local notif, entries = {}, {}
			local files, updates = 0, 0

			if result.documentChanges then
				for _, document in pairs(result.documentChanges) do
					files = files + 1
					local uri = document.textDocument.uri
					local bufnr = vim.uri_to_bufnr(uri)

					for _, edit in ipairs(document.edits) do
						local start_line = edit.range.start.line + 1
						local line = vim.api.nvim_buf_get_lines(bufnr, start_line - 1, start_line, false)[1]
						table.insert(entries, {
							bufnr = bufnr,
							lnum = start_line,
							col = edit.range.start.character + 1,
							text = line,
						})
					end
					updates = updates + vim.tbl_count(document.edits)
					local short_uri = string.sub(vim.uri_to_fname(uri), #vim.loop.cwd() + 2)
					table.insert(notif, string.format("\t- %d in %s", vim.tbl_count(document.edits), short_uri))
				end
			end
			if result.changes then
				for uri, edits in pairs(result.changes) do
					files = files + 1
					local bufnr = vim.uri_to_bufnr(uri)
					for _, edit in ipairs(edits) do
						local start_line = edit.range.start.line + 1
						local line = vim.api.nvim_buf_get_lines(bufnr, start_line - 1, start_line, false)[1]
						table.insert(entries, {
							bufnr = bufnr,
							lnum = start_line,
							col = edit.range.start.character + 1,
							text = line,
						})
					end
					updates = updates + vim.tbl_count(edits)
					local short_uri = string.sub(vim.uri_to_fname(uri), #vim.loop.cwd() + 2)
					table.insert(notif, string.format("\t- %d in %s", vim.tbl_count(edits), short_uri))
				end
			end
			local str = ""
			if files > 1 then
				table.insert(
					notif,
					1,
					string.format("made %d change%s in %d files", updates, (updates > 1 and "s") or "", files)
				)
				str = table.concat(notif, "\n")
			else
				str = string.format("made %s", notif[1]:sub(4))
				local iloc = str:find("in")
				str = table.concat({
					str:sub(1, iloc - 1),
					string.format("change%s ", (updates > 1 and "s") or ""),
					str:sub(iloc),
				}, "")
			end
			vim.notify(str, "info", {
				title = string.format("[LSP] rename: %s -> %s", param.old, param.newName),
				timeout = 2500,
			})
		end)
	end)
end

vim.lsp.buf.rename = _rename

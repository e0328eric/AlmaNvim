local wk = require("which-key")

local function run_vesti()
	local err_lines = {}

	local job_id = vim.fn.jobstart({ "vesti", "compile" }, {
		-- Important for clean line handling:
		stderr_buffered = true,
		stdout_buffered = true,

		on_stderr = function(_, data, event)
			-- data is a table of lines, or nil at stream close
			if not data then
				return
			end
			for _, line in ipairs(data) do
				if line and line:match("%S") then -- non-empty / non-whitespace
					table.insert(err_lines, "[stderr] " .. line)
				end
			end
		end,

		on_stdout = function(_, data, event)
			if not data then
				return
			end
			for _, line in ipairs(data) do
				if line and line:match("%S") then
					-- Optionally also show stdout in quickfix so you see context
					table.insert(err_lines, "[stdout] " .. line)
				end
			end
		end,

		on_exit = function(_, code, _)
			if code == 0 and #err_lines == 0 then
				vim.notify("vesti succeeded", vim.log.levels.INFO)
				return
			end

			-- If we have messages, show them even if code == 0
			local msg = ("vesti failed (exit=%d)"):format(code)
			vim.notify(msg, vim.log.levels.ERROR)

			if #err_lines == 0 then
				-- no output at all, but non-zero exit code; add synthetic line
				table.insert(err_lines, "vesti exited with code " .. code .. " but produced no output")
			end

			vim.fn.setqflist({}, " ", {
				title = "vesti errors",
				lines = err_lines,
			})
			vim.cmd("copen")
		end,
	})

	if job_id <= 0 then
		vim.notify("Failed to start `vesti compile` (jobstart error)", vim.log.levels.ERROR)
	end
end

wk.add({
	{
		"<leader>cc",
		run_vesti,
		desc = "Compile vesti",
	},
})
